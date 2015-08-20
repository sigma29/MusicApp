class AddRecordingTypeColumntoAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :recording_type, :string
    change_column :albums, :recording_type, :string, null: false
  end
end
