class CreateMainboards < ActiveRecord::Migration
  def change
    create_table :mainboards do |t|
      t.string :name

      t.timestamps
    end
  end
end
