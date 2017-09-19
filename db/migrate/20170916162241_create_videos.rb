class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name, null:false, limit: 50
      t.string :category, null:false, limit: 40
      t.float :time, null:false
      t.string :address, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
