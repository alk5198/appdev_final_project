class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|

      t.integer :user_id

      t.integer :event_id

      t.string :event_response

      t.integer :back_out


      t.timestamps

    end

  end
end
