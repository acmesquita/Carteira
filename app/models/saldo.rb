class Saldo < ApplicationRecord
  belongs_to :banco

  validates :data, :valor, presence: true
  validades :valor, length: {minimum: 0}
end
