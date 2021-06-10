Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :live_streams, only: [] do
    collection do
      get :log_file
    end
  end
end
