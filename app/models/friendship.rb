class Friendship < ActiveRecord::Base

  belongs_to :sender, :class_name => "User", :foreign_key => "user_id_1"
  #
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id_2"
  #
  validates :user_id_1, :presence => true, :uniqueness => { :scope => :user_id_2 }
  validates :user_id_2, :presence => true
  validates :message, :presence => true

end
