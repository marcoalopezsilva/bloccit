Rails.application.routes.draw do
    #NL: Calls the 'resources' method and passes it a Symbol (':posts')
    #This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post.
    resources :topics do
      #NL ins necessary to nest posts into topics
      resources :posts, except: [:index]
    end

    #NL: we use only: [] because we don't want to create any /posts/:id routes, just  posts/:post_id/comments routes.
    resources :posts, only: [] do
        #NL: We'll display comments on the posts show view, so we won't need index or new routes.
        # We also won't give users the ability to view individual comments or edit comments, removing the need for show, update, and edit routes.
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
        #These new lines create POST routes at the URL posts/:id/up-vote and  posts/:id/down-vote.
        # The as key-value pairs at the end stipulate the method names which will be associated with these routes: up_vote_path and down_vote_path.
        post '/up-vote' => 'votes#up_vote', as: :up_vote
        post '/down-vote' => 'votes#down_vote', as: :down_vote
    end

    resources :users, only: [:new, :create, :show]

    resources :sessions, only: [:new, :create, :destroy]

    get 'about' => 'welcome#about'

    root "welcome#index"
end
