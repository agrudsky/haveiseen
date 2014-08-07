class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :gender
      t.string :email

      t.timestamps
    end
  end
end
