Rails.application.routes.draw do
  root 'overview#index', via: :get

  resources 'recipes', only: [:show, :new, :create, :edit, :update]
end
