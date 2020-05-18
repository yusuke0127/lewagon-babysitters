class RemoveStatusFromReservation < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :status, :string
  end
end
