class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.text :img_url
      t.boolean :privacy, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
