class AddCategoriaToDividendo < ActiveRecord::Migration[5.2]
  def change
    add_reference :dividendos, :categoria, foreign_key: true
  end
end
