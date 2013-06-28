class CreateChallengesUsers < ActiveRecord::Migration
  def change
    create_table :challenges_users do |t|
    	t.string :status
    	t.references :user, :challenge
    end
  end
end
