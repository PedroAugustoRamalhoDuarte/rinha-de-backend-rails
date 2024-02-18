class Transacao < ApplicationRecord
  belongs_to :cliente

  enum :tipo, { c: 0, d: 1 }, validate: true

  validates :valor, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :descricao, length: { in: 1..10 }, presence: true
  validate :validar_limite, on: :create

  after_create :atualizar_saldo

  private

  def atualizar_saldo
    novo_saldo = tipo == "c" ? cliente.saldo + valor : cliente.saldo - valor
    cliente.update_column(:saldo, novo_saldo) # Does not update timestamp
  end

  def validar_limite
    return if cliente.nil? && tipo.blank? && valor.blank?

    if tipo == "d"
      saldo_anterior = cliente.saldo
      novo_saldo = saldo_anterior - valor
      errors.add(:valor, 'Saldo inconsistente') if novo_saldo < -cliente.limite
    end
  end
end
