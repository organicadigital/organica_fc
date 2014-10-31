Rails.application.routes.draw do
  devise_for :players

  root to: "classification#index"

  # get "/games", controller: :classification, action: :games

  controller :classification do
    get "/games", action: :games
    get "/games/new", action: :new
    post "/games/new", action: :create
  end
end
