class CreateBancos < ActiveRecord::Migration[5.2]
  def change
    create_table :bancos do |t|
      t.string :nome
      t.string :tipo

      t.timestamps
    end
  end
end
