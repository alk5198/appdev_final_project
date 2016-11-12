class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :title

      t.text :description

      t.string :street

      t.string :city

      t.string :state

      t.integer :zip

      t.string :neighborhood

      t.integer :number_of_spots

      t.datetime :date_time

      t.string :image_url

      t.string :public_private

      t.integer :flakiness_bar

      t.integer :user_id


      t.timestamps

    end

  end
end
