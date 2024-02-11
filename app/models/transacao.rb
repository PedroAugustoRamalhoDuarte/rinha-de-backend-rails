class Transacao < ApplicationRecord
  belongs_to :cliente

  enum :tipo, { c: 0, d: 1 }, validate: true

  validates :valor, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :descricao, length: { in: 1..10 }, presence: true
  validate :validar_limite, on: :create

  def validar_limite
    if cliente && tipo && valor
      saldo_anterior = cliente.saldo
      novo_saldo = tipo == 'c' ? saldo_anterior + valor : saldo_anterior - valor
      if novo_saldo < -cliente.limite
        errors.add(:valor, 'Saldo inconsistente')
      end
    end
  end
end
