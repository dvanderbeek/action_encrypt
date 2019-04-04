Rails.application.routes.draw do
  resources :users
  mount ActionEncrypt::Engine => "/action_encrypt"
end
