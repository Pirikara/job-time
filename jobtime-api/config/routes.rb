Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: 'json' } do
    resources :timecards, only: [:create, :update, :show, :index]
    resources :users, only: [:index, :create]
  end
end

create role "rw-user" login createdb password "rwf"
create role "rw-user" login createdb password 'rwf'