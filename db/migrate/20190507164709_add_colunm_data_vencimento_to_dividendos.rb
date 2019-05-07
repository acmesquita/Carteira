class AddColunmDataVencimentoToDividendos < ActiveRecord::Migration[5.2]
  def change
    add_column :dividendos, :data_vencimento, :date
  end
end
