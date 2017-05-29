Rails.application.routes.draw do

  # when we eventually want to version the API - namespace the controllers without affecting the URI
  # scope module: :v2, constraints: ApiVersion.new('v2') do
  #   resources :spreadsheets, only: [:show]
  # end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :spreadsheets, only: [:index, :create, :show] do
      post 'update', to: 'spreadsheets#update'
      post 'upvote', to: 'spreadsheets#upvote'
      post 'destroy', to: 'spreadsheets#destroy'
    end
    resource :spreadsheets, only: [] do
      get 'upvoted', to: 'spreadsheets#upvoted'
      get 'created', to: 'spreadsheets#created'
      get 'submitted', to: 'spreadsheets#submitted'
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'user', to: 'users#show'
end
