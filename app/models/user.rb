class User
  include Mongoid::Document


  field :name
  field :alias
  field :email

  def screen_name
    self.alias || self.name
  end
end