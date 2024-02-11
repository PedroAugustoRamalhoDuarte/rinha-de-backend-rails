require 'rails_helper'

RSpec.describe "Cliente::TransacoesController", type: :request do
  describe 'POST /clientes/:id/transacoes' do
    let(:cliente) { create(:cliente, limite: 1000) }
    let(:transacao_params) do
      {
        transacao: {
          valor: 100,
          tipo: "c",
          descricao: 'Depósito'
        }
      }
    end

    it 'retorna o limite e o saldo correto do cliente' do
      post "/clientes/#{cliente.id}/transacoes", params: transacao_params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({
                                                "limite" => cliente.limite,
                                                "saldo" => 100
                                              })
    end

    context "quando a transacao fere a regra de limites" do
      let(:transacao_params) do
        {
          transacao: {
            valor: 1100,
            tipo: 'd',
            descricao: 'Compra'
          }
        }
      end

      it 'returns an error' do
        post "/clientes/#{cliente.id}/transacoes", params: transacao_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
