# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    new_post_path
  end
end
