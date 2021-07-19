Rails.application.routes.draw do
  scope '/api' do
    devise_for :admin_users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
