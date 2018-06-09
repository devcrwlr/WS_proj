class CreateMp4s < ActiveRecord::Migration[5.1]
  def change
    create_table :mp4s do |t|

      t.timestamps
    end
  end
end
