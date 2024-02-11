require 'rails_helper'

RSpec.describe "Cliente::ExtratoController", type: :request do
  describe 'GET /clientes/:id/extrato' do
    let(:cliente) { create(:cliente, limite: 1000, transacoes: [
      build(:transacao, valor: 100, tipo: "c", descricao: 'Depósito'),
    ]) }

    it 'retorna o extrato corretamente' do
      get "/clientes/#{cliente.id}/extrato"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["saldo"]["total"]).to eq(100)
      expect(JSON.parse(response.body)["ultimas_transacoes"][0]["valor"]).to eq(100)
    end
  end
end
