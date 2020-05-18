class CreateBabysitters < ActiveRecord::Migration[6.0]
  def change
    create_table :babysitters do |t|
      t.integer :age
      t.integer :price_per_hour
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
