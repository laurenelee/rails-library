Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/books', to: 'books#index', as: 'books'
  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books', to: 'books#create'

  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  put '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  post '/books/:id/checkout', to: 'books#checkout', as: 'checkout_book'

  # resources :books
end
