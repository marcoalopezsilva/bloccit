Rails.application.routes.draw do
    #NL: Calls the 'resources' method and passes it a Symbol (':posts')
    #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post.
    resources :posts

    get 'about' => 'welcome#about'

    root "welcome#index"
end
