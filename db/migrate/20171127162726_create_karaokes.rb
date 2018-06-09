class CreateKaraokes < ActiveRecord::Migration[5.1]
  def change
    create_table :karaokes do |t|

      t.timestamps
    end
  end
end
