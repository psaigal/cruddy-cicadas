class CreateUsersFoodItems < ActiveRecord::Migration
  def change
    create_table :users_foods do |t|
      t.integer :food_id
      t.integer :user_id
      t.timestamps

    end
  end
end
