class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :img_url
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
