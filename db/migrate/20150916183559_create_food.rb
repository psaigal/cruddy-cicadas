class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :glycemic_index
      t.timestamps
    end
  end
end
