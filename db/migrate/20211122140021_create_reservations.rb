class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :date , null: false
      t.references :schedule , type: :bigint , foreign_key: true , null: false ,  unique: true
      t.references :sheet , type: :bigint , foreign_key: true , null: false  , unique: true
      t.integer :movie_id , null: false , foreign_key: { to_table: :movies }
      t.string :name , :limit=>50 , null: false
      t.string :email , :limit=>255 , null: false

      t.timestamps
    end
    add_foreign_key :reservations,:movies
    add_foreign_key :reservations,:schedules
    add_foreign_key :reservations,:sheets
    add_index :reservations, [:schedule_id,  :sheet_id, :date], unique: true , name: :reservation_schedule_sheet_unique
  end
end