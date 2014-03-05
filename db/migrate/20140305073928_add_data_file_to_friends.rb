class AddDataFileToFriends < ActiveRecord::Migration
  def self.up
    add_attachment :friends, :data_file
  end

  def self.down
    remove_attachment :friends, :data_file
  end
end
