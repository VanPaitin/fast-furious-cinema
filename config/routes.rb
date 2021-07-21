Rails.application.routes.draw do
  scope '/api' do
    devise_for :admin_users, defaults: { format: :json }
  end
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show, :update] do
        post :rating, on: :member
      end
    end
  end
  root to: redirect(ENV['API_DOCUMENTATION'])
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
