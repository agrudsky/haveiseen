class AddAndRemoveSomeColumnsFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :releasedate
    add_column :movies, :releaseyear, :string
    remove_column :movies, :genre
    remove_column :movies, :director
    remove_column :movies, :writer
    remove_column :movies, :actors
    add_column :movies, :cast, :string
    remove_column :movies, :plot
    add_column :movies, :synopsis, :string
    remove_column :movies, :language
    remove_column :movies, :country
    remove_column :movies, :awards
    remove_column :movies, :metascore
    remove_column :movies, :imdbrating
    add_column :movies, :critics_rating, :string
    add_column :movies, :critics_score, :string
    add_column :movies, :audience_rating, :string
    add_column :movies, :audience_score, :string
  end
end
