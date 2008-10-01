ActionController::Routing::Routes.draw do |map|
  map.resources :units, :has_many => [:units,  :user_units, :parts]
  map.resources :parts, :has_many => [:user_parts, :q_and_as]

  map.resources :user_units, :has_many => [:sub_user_units, :user_parts]
  map.resources :user_parts, :has_many => [:user_q_and_as]
  map.resources :user_q_and_as

  map.resources :users, :has_many => [:user_units]
  map.resource :sessions
  map.logout '/register', :controller => 'users', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  map.root :controller => "units"
  
  map.mockup "/:name", :controller => "mockups", :action => "show"
end
