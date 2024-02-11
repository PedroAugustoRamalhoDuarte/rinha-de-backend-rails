class Cliente < ApplicationRecord
  has_many :transacoes, dependent: :destroy

  def saldo
    @saldo ||= transacoes.sum("CASE WHEN tipo = #{Transacao.tipos[:c]} THEN valor ELSE -valor END")
  end
end
