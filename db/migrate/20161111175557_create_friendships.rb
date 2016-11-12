class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|

      t.integer :user_id_1

      t.integer :user_id_2

      t.string :relationship


      t.timestamps

    end

  end
end
