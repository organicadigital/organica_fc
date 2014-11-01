Rails.application.routes.draw do
  devise_for :players

  root to: "classification#index"

  controller :games, path: "/games" do
    get "/", action: :index, as: :games
    get "/new", action: :new, as: :new_game
    post "/new", action: :create, as: false
  end
end
