class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :songname
      t.string :singername
      t.string :mp4
      t.string :mp3
      t.string :lyrics

      t.timestamps
    end
  end
end
