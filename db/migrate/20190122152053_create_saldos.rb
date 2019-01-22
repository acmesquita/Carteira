class CreateSaldos < ActiveRecord::Migration[5.2]
  def change
    create_table :saldos do |t|
      t.date :data
      t.float :valor
      t.references :banco, foreign_key: true

      t.timestamps
    end
  end
end
