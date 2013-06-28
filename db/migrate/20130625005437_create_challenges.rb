class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
    	t.string :title
    	t.string :description
    	t.integer :value
    	t.integer :level

      t.timestamps
    end
  end
end
