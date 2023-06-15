# frozen_string_literal: true

module Posts
  class AttachImage
    def initialize(params:, current_user:)
      @params = params
      @current_user = current_user
    end

    def call
      image = fetch_image
      tags = extract_tags(image)
      body = generate_post_body(tags)
      create_post(body)
    end

    private

    def fetch_image
      File.open(@params[:post][:image].tempfile, 'rb') { |file| file.read }
    end

    def extract_tags(image)
      Api::Rekognition.new(image: image).call
    end

    def generate_post_body(tags)
      chat_response = Api::ChatGpt.new(message: tags.join(', ')).call
      chat_response['choices'].first['message']['content']
    end

    def create_post(body)
      post = @current_user.posts.create!(body: body)
      post.image.attach(@params[:post][:image])
      post
    end
  end
end
