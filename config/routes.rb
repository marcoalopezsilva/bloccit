Rails.application.routes.draw do
    #NL: Calls the 'resources' method and passes it a Symbol (':posts')
    #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post.
    resources :topics do
      #NL ins necessary to nest posts into topics
      resources :posts, except: [:index]
    end

    resources :users, only: [:new, :create]

    get 'about' => 'welcome#about'

    post 'users/confirm' => 'users#confirm'

    root "welcome#index"
end
