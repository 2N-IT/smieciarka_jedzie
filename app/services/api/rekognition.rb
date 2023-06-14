class Api::Rekognition
  # i have image in /app/assets/images/ski_boots.png
  def initialize(image:)
    @image = image
  end

  def call
    client = Aws::Rekognition::Client.new
    resp = client.detect_labels({
      image: {
        bytes: @image
      },
      max_labels: 10,
      min_confidence: 75
    })
    resp.labels.map(&:name)
  end
end
