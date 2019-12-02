class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|

      t.timestamps
      t.integer :followee_id
      t.integer :follower_id
    end
  end
end
