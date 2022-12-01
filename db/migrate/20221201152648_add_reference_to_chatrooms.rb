class AddReferenceToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :tour, null: false, foreign_key: true
  end
end
