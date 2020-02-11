Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :packages, only: :index
    end
  end
end
