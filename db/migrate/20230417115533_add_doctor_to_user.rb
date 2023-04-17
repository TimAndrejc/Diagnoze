class AddDoctorToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :doctor, :boolean
  end
end
