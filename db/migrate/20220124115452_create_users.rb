class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, :null => false
      t.string :password, :null => false
      t.string :nickname
      t.string :email
      t.integer :role_id

      t.timestamps
    end
  end
end
