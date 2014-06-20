class Event
  include Mongoid::Document


  field :name
  field :date
  field :runner


  embeds_many :attendees


  validates_uniqueness_of :date

  def attendees_names
    self.attendees.map(&:user_name) rescue []
  end

  def runner_name
    user = User.find(runner)

    user.alias || user.name
  rescue
    "Unknown"
  end

end