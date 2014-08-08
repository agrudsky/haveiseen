class AddMovieTitleAndUserNameToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :movie_title, :string
    add_column :watches, :username, :string
  end
end
