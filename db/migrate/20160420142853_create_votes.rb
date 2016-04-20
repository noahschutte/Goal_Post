class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.references :user, null: false, index: true
      t.integer :votable_id, null: false, index: true
      t.string :votable_type, null: false, index: true

      t.timestamps null: false
    end
  end
end
