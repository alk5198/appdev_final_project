class AddMessageToFriendships < ActiveRecord::Migration
  def change
      add_column :friendships, :message, :text
  end
end
