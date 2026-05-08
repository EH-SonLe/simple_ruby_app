class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :username
      t.string :email
    end
  end
end
