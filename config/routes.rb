Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :accounts
    resources :news
    root "static_pages#index"
    post "static_pages/update"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
