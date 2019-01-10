Rails.application.routes.draw do
  resources :part_issues
  resources :invoices do
    # nested resouces for invoices
    resources :issues
    resources :parts
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'invoices#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
