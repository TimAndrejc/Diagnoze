class CreateDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnoses do |t|
      t.text :alldiagnoses
      t.text :chosen

      t.timestamps
    end
  end
end
