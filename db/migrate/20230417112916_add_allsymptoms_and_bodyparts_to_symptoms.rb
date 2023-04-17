class AddAllsymptomsAndBodypartsToSymptoms < ActiveRecord::Migration[7.0]
  def change
    add_column :symptoms, :allsymptoms, :text
    add_column :symptoms, :bodyparts, :text
  end
end
