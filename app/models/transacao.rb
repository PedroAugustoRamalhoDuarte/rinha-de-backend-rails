class Transacao < ApplicationRecord
  belongs_to :cliente

  enum :tipo, { c: 0, d: 1 }, validate: true

  validate :validar_limite, on: :create
  validates :valor, numericality: { greater_than: 0 }, presence: true
  validates :descricao, length: { in: 1..10 }, presence: true

  def validar_limite
    if cliente
      saldo_anterior = cliente.saldo
      novo_saldo = tipo == 'c' ? saldo_anterior + valor : saldo_anterior - valor
      if novo_saldo < -cliente.limite
        errors.add(:valor, 'Saldo inconsistente')
      end
    end
  end
end
