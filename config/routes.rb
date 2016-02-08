Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :tasks
    get 'tasks/:id/up_priority', to: 'tasks#up_priority', as: :up_priority
    get 'tasks/:id/down_priority', to: 'tasks#down_priority', as: :down_priority
    get 'tasks/:id/dead_line_edit', to: 'tasks#dead_line_edit', as: :dead_line_edit
  end

end
