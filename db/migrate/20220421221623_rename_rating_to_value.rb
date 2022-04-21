class RenameRatingToValue < ActiveRecord::Migration[6.1]
  def change
    rename_column :ratings, :rating, :value
  end
end
