class Attendee

  include Mongoid::Document

  field :user_id

  embedded_in :event, :inverse_of => :attendees

  validates_presence_of :user_id
  validates_uniqueness_of :user_id


  def user_name
    user = User.find(user_id)
    user.screen_name
  end

end