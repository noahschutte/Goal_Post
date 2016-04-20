class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user, null: false, index: true
      t.integer :commentable_id, null: false, index: true
      t.string :commentable_type, null: false, index: true

      t.timestamps null: false
    end
  end
end
