StockMarket::Application.routes.draw do
  
# See http://guides.rubyonrails.org/routing.html
 
  get "home/index"
  get "home/startgame"
  get "home/admin"
  get "home/commandresult"
  get "home/logout"

resources :titles do
  collection do
    get 'sell'
    post 'sell'
    get 'buy'
    post 'buy'
    get 'list'
    post 'list'
    post 'action'
  end
end

# Single resource: one portfolio (to be confirmed)
resources :portfolio

# Single resource: just one player is THE PLAYER (myself)
# One player has many invitations
resources :player do
  collection do
    get 'list'
    post 'list'
    resources :invitations do
      collection do
        get 'waiting'
        post 'accept'
      end
    end
  end
end

# Single resource
resources :game

root :to => 'home#index'

end
