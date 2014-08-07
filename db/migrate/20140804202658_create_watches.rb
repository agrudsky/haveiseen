class CreateWatches < ActiveRecord::Migration
  def change
    create_table :watches do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :when
      t.string :where

      t.timestamps
    end
  end
end
