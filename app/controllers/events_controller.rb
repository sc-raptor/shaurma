class EventsController < ApplicationController

  before_filter :find_event, :except => [:index, :last]

  def index
    @events = Event.order_by(:date => :desc)
    @users = User.all
  end

  def last
    render :json => Event.last
  end

  def add_attendee
    @event.attendees << Attendee.new(:user_id => @user.id)
    if @event.save
      render :json => {:status => :saved}
    else
      render :json => {:status => :not_saved}
    end
  end

  def remove_attendee
    if @event.attendees.where(:user_id => @user.id).first.destroy
     render :json => {:status => :destroyed}
    else
      render :json => {:status => :not_destroyed}
    end
  end

  def attendees
    render :json => {:names => @event.attendees_names, :count => @event.attendees_names.count}
  end


  private

  def find_event
    @event = Event.where(:_id => params[:id]).first
  end


end