Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :doctors

  get '/', to: 'doctors#index'
  get '/appointments', to: 'doctors#all_appointments'
  get '/:id', to: 'doctors#show'
  get '/appointments/:date', to: 'doctors#show_appointments_for_specific_day'



  post '/delete_appointment', to:'doctor#delete_appointment'
  post '/add_appointment', to:'doctor#add_appointment'

end
