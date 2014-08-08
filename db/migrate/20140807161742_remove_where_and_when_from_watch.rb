class RemoveWhereAndWhenFromWatch < ActiveRecord::Migration
  def change
    remove_column :watches, :where
    remove_column :watches, :when
  end
end
