class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.integer :number_of_children
      t.references :user, null: false, foreign_key: true
      t.references :babysitter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
