class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|

      t.integer :tag_id

      t.integer :event_id


      t.timestamps

    end

  end
end
