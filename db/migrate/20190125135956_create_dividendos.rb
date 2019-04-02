class CreateDividendos < ActiveRecord::Migration[5.2]
  def change
    create_table :dividendos do |t|
      t.string :descricao
      t.boolean :pago, default: false
      t.float :valor

      t.timestamps
    end
  end
end
