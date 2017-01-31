class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :recipient_id
      t.integer :author_id
      t.boolean :read, default: false

      t.timestamps null: false
    end

    add_index :messages, :author_id
    add_index :messages, :recipient_id
  end
end
