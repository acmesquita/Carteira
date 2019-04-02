class AddDividendoToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :dividendos, :user, foreign_key: true
  end
end
