class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :zip_code
      t.string :phone_number
      t.string :password_digest
      t.string :password_confirmation
      t.string :api_key
      t.timestamps
    end
  end
end
