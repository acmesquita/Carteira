class AddBancoToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :bancos, :user, foreign_key: true
  end
end
