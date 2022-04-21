class AddUserRefToSongs < ActiveRecord::Migration[6.1]
  def change
    add_reference :songs, :user, foreign_key: true
  end
end
