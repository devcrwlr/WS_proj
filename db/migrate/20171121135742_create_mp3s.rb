class CreateMp3s < ActiveRecord::Migration[5.1]
  def change
    create_table :mp3s do |t|

      t.timestamps
    end
  end
end
