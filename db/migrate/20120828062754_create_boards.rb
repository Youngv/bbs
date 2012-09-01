class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :description
      t.integer :mainboard_id

      t.timestamps
    end
  end
end
