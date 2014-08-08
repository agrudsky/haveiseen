class RemoveCastAndChangeReleaseyearToYear < ActiveRecord::Migration
  def change
    remove_column :movies, :cast
    remove_column :movies, :releaseyear
    add_column :movies, :year, :string
  end
end
