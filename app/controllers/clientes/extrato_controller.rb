class Clientes::ExtratoController < ApplicationController
  def index
    cliente = Cliente.find(params[:id])
    transacoes = cliente.transacoes.limit(10).order(created_at: :desc)
    render(json: Panko::Response.create do |r|
      {
        saldo: r.serializer(cliente, SaldoSerializer),
        ultimas_transacoes: Panko::ArraySerializer.new(transacoes, each_serializer: TransacoesSerializer)
      }
    end, status: :ok)
  end
end