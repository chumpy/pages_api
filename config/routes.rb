Pages::Application.routes.draw do
  scope '/api' do
    resources :pages do
      member do
        get  :total_words
        post :publish
      end
      collection do
        get :published
        get :unpublished
      end
    end
  end
end
