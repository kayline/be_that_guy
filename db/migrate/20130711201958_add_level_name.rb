class AddLevelName < ActiveRecord::Migration
  def change
  	add_column :challenges, :level_name, :string
  end
end
