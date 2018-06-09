class CreateLyrics < ActiveRecord::Migration[5.1]
  def change
    create_table :lyrics do |t|

      t.timestamps
    end
  end
end
