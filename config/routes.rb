Rails.application.routes.draw do

  get 'post/index'
  get 'post/new'
  get 'post/new'
  post 'post/create'
#params引いてるから最下層に
  get 'post/:id' => 'post#show'
  get 'post/:id/edit' => 'post#edit'
  post 'post/:id/update' => 'post#update'
  post 'post/:id/destroy' => 'post#destroy'

#ここから
  get 'test/nanika'
  get 'test/new' => 'test#new'
  get 'test/:id' => 'test#show'
#ここまでテスト用(見りゃわかるか((()
  devise_for :users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
