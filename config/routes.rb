# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'static#dashboard', as: :authenticated_root
  end

  root 'static#home'
end
