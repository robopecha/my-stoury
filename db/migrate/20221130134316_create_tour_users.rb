class CreateTourUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tour_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
