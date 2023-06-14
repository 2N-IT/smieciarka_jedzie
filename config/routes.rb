# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'static#dashboard', as: :authenticated_root
    resources :posts, expect: %i[create] do
      post :attach_image, to: 'posts#attach_image', on: :collection
      post :publish_post, to: 'posts#publish_post', on: :collection
      get :post_published, to: 'posts#post_published'
    end
  end

  root 'static#home'
end
