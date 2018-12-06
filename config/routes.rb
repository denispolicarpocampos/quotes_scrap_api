Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create update destroy] do
        get 'current', on: :collection
      end
      get '/quotes/:search_tag', to: 'quotes#show'
      post 'user_token', to: 'user_token#create'
    end
  end
end
