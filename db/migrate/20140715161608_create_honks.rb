class CreateHonks < ActiveRecord::Migration
  def change
    create_table :honks do |t|
      t.integer :user_id
      t.string :content
    end
  end
end
