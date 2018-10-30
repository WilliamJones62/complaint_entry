Rails.application.routes.draw do
  resources :part_issues
  resources :issues
  resources :parts
  resources :invoices
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
