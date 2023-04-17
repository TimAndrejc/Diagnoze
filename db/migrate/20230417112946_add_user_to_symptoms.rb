class AddUserToSymptoms < ActiveRecord::Migration[7.0]
  def change
    add_reference :symptoms, :user, null: false, foreign_key: true
  end
end
