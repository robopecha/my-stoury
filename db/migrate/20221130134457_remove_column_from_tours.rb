class RemoveColumnFromTours < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tours, :user, null: false, foreign_key: true
  end
end
