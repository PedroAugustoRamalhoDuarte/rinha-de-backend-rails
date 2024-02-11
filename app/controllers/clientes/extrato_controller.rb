class Clientes::ExtratoController < ApplicationController
  def index
    cliente = Cliente.find(params[:id])
    transacoes = cliente.transacoes.limit(10).order(created_at: :desc)
    render json: {
      saldo: {
        total: cliente.saldo,
        data_extrato: Time.zone.now,
        limite: cliente.limite,
      },
      ultimas_transacoes: transacoes.map do |transacao|
        {
          valor: transacao.valor,
          tipo: transacao.tipo,
          descricao: transacao.descricao,
          realizada_em: transacao.created_at,
        }
      end
    }, status: :ok
  end
end