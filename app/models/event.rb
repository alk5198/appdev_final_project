class Event < ActiveRecord::Base

  has_many :event_comments
  belongs_to :user
  validates :title, :presence => true
  validates :date_time, :presence => true

end
