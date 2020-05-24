Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: 'json' } do
    resources :users, only: [:index, :create]

    post 'timecards/jobin', to: 'timecards#jobin'
    put 'timecards/jobout', to: 'timecards#jobout'
    get 'timecards/schedule', to: 'timecards#schedule'
  end
end