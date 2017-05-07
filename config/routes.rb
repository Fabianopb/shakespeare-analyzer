Rails.application.routes.draw do

  root to: 'analyzer#index'

  get 'analyzer/index'
  get 'analyzer/results_data', defaults: { format: 'json' }

  post 'analyzer/results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
