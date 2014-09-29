Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  get '*path', to: 'dashboard#show'
end
