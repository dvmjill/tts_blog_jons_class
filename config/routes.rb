Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root    'sessions#new'
    get     'posts'           => 'posts#index',     as: 'posts'
    post    'posts'           => 'posts#create'
    get     'posts/new'       => 'posts#new',       as: 'new_post'
    get     'posts/:id'       => 'posts#show',      as: 'post'
    delete  'posts/:id'       => 'posts#destroy'
    patch   'posts/:id'       => 'posts#update'
    get     'posts/:id/edit'  => 'posts#edit',      as: 'edit_post'

    get     'users'           => 'users#index',     as: 'users'
    get     'users/new'       => 'users#new',       as: 'new_user'
    post    'users'           => 'users#create'
    get     'users/:id'       => 'users#show',      as: 'user'
    patch   'users/:id'       => 'users#update'
    get     'users/:id/edit'  => 'users#edit',      as: 'edit_user'

    get     'posts/:post_id/comments/new'     => 'comments#new',      as: 'new_comment'
    post    'posts/:post_id/comments'         => 'comments#create', as: 'post_comments'
    get     'comments/:id'                    => 'comments#show',   as: 'comment'

    get     'login'                           => 'sessions#new',     as: 'new_session'
    post    'login'                           => 'sessions#create'

    # get     'comments'           => 'comments#index',     as: 'comments'
    # post    'comments'           => 'comments#create'
    # get     'comments/new'       => 'comments#new',       as: 'new_comment'
    # get     'comments/:id'       => 'comments#show',      as: 'comment'
    # delete  'comments/:id'       => 'comments#destroy'
    # patch   'comments/:id'       => 'comments#update'
    # get     'comments/:id/edit'  => 'comments#edit',      as: 'edit_comment'





end
