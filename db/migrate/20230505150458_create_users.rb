class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :token
      t.string :email
      t.string :password_digest
      t.integer :access_level

      t.timestamps
    end
  end
end
