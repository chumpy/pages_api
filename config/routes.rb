Pages::Application.routes.draw do
  scope '/api' do
    resources :pages
  end
end
