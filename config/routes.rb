Shaurma::Application.routes.draw do
  #get 'users' => 'users#index'
  #get 'events' => 'events#index'
  #get 'events/last' => 'events#last'
  #post 'users' => 'users#create'
  post 'events/:id/attendee' => 'events#add_attendee'
  post 'events/:id/del_attendee' => 'events#remove_attendee'
  get 'events/:id/attendees' => 'events#attendees'

  root :to => 'events#index'
end
