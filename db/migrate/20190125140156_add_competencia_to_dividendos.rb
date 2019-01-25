class AddCompetenciaToDividendos < ActiveRecord::Migration[5.2]
  def change
    add_column :dividendos, :competencia, :date, default: false
  end
end
