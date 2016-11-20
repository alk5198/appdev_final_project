class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_requests_where_sender, :class_name => "Friendship", :foreign_key => "user_id_1"

  has_many :friends_where_sender, :through => :friend_requests_where_sender, :source => :receiver


  has_many :friend_requests_where_receiver, :class_name => "Friendship", :foreign_key => "user_id_2"

  has_many :friends_where_receiver, :through => :friend_requests_where_receiver, :source => :sender

  belongs_to :score


end
