class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id , null: false , foreign_key: { to_table: :movies }
      t.time :start_time , null: false
      t.time :end_time , null: false
      t.timestamps
    end
  end
end

# add_foreign_key :参照元テーブル, :参照先テーブル, column: :参照するカラム , primary_key: :参照するテーブルの主キー

# +------------+----------+------+-----+-------------------+-------------------+
# | Field      | Type     | Null | Key | Default           | Extra             |
# +------------+----------+------+-----+-------------------+-------------------+
# | id         | int      | NO   | PRI | NULL              | auto_increment    |
# | movie_id   | int      | NO   | MUL | NULL              |                   |
# | start_time | time     | NO   |     | NULL              |                   |
# | end_time   | time     | NO   |     | NULL              |                   |
# | created_at | datetime | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
# | updated_at | datetime | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
# +------------+----------+------+-----+-------------------+-------------------+