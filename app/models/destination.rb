class Destination < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  before_save :titleize_name

  validates_presence_of :name
  validate :name_unique_to_user

  def titleize_name
    self.name = self.name.titleize
  end

  def name_unique_to_user
    if Destination.find_by(
                            name: self.name.titleize,
                            user_id: self.user_id
                          )
      errors.add(:name, "must be unique")
    end
  end
end
