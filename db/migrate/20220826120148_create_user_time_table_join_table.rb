class CreateUserTimeTableJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :time_tables do |t|
      # t.index [:user_id, :time_table_id]
      # t.index [:time_table_id, :user_id]
    end
  end
end
