class Clientes::TransacoesController < ApplicationController
  def create
    begin
      @cliente = Cliente.find(params[:id])
      @cliente.with_lock do
        @cliente.transacoes.create!(transacao_params)
      end

      render json: {
        limite: @cliente.limite,
        saldo: @cliente.saldo,
      }, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors }, status: :unprocessable_entity
    end
  end

  private

  def transacao_params
    params.permit(:valor, :tipo, :descricao)
  end
end