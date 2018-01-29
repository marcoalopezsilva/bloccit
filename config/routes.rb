Rails.application.routes.draw do
     #NL: Calls the 'resources' method and passes it a Symbol (':posts')
    #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post.
    resources :topics do
      #NL is necessary to nest posts and sponsored_posts into topics
      resources :posts, except: [:index]
      resources :sponsored_posts, except: [:index]
    end

    get 'about' => 'welcome#about'

    root "welcome#index"
end
