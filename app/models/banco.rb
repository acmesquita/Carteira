class Banco < ApplicationRecord
    has_many :saldos
    belongs_to :user
end
