class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :category
      t.float :time
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
