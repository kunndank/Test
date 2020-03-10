Rails.application.routes.draw do

  root to: "articles#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :users do
  	collection do 
        put 'bulk_archive_articles'
        put 'bulk_archive_articles'
      end
  	resources :articles
  end
  resources :articles
end
