Rails.application.routes.draw do
  devise_for :players

  root to: redirect("/championships")

  resources :championships, only: [:index, :new, :create]

  scope "/:championship_id" do
    resources :scores, except: [:delete, :show]
    resources :games, except: [:new, :create, :delete, :show] do
      post :cancel, on: :member
    end
  end
end
