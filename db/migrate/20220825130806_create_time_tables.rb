class CreateTimeTables < ActiveRecord::Migration[6.0]
  def change
    create_table :time_tables do |t|
      t.timestamp :start_time
      t.boolean :active
      t.timestamps
    end
  end
end
