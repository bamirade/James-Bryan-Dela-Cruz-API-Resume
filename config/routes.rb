Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "informations#index"

  get '/api', to: "informations#routes"
  get '/api/contact', to: "informations#contact_info"
  get '/api/experience', to: "informations#experience"
  get '/api/project', to: "informations#project"
  get '/api/resume', to: "informations#resume"

  post '/api/feedback', to: "informations#feedbacks"
end
