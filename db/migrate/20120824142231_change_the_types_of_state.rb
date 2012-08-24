class ChangeTheTypesOfState < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :state
  		t.boolean :state, :default => 0
  	end
  end
end
