class Cliente < ApplicationRecord
  has_many :transacoes, dependent: :destroy

  def calcular_saldo
    transacoes.sum("CASE WHEN tipo = #{Transacao.tipos[:c]} THEN valor ELSE -valor END")
  end
end
