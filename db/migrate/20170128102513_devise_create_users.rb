class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at
      t.string :name
      t.boolean :admin

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
