class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :flakiness_score
      t.integer :creator_score
      t.integer :overall_score

      t.timestamps null: false
    end
  end
end
