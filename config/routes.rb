Rails.application.routes.draw do

  root to: 'analyzer#index'

  get 'analyzer/index'

  post 'analyzer/results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
