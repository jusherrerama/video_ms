class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name, null:false, limit: 50
      t.string :category, null:false, limit: 40
      t.float :time, null:false
      t.string :address, null:false
      t.string :url_address
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.integer :visits, default: 0
      t.integer :comments, default: 0
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
