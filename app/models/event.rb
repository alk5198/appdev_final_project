class Event < ActiveRecord::Base

  has_many :event_comments
  belongs_to :user

  validates :title, :presence => true
  validates :date_time, :presence => true
  validates :address, :presence => true
  validates :number_of_spots, numericality: { only_integer: true, :greater_than => 0 }
  validates :flakiness_bar, numericality: { only_integer: true, :greater_than => 0, allow_nil: true }



  has_many :responses, :dependent => :destroy

  validates_associated :responses

end
