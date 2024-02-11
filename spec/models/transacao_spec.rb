require 'rails_helper'

RSpec.describe Transacao, type: :model do
  describe "validações" do
    it "é válido com todos os atributos" do
      expect(build(:transacao)).to be_valid
    end
    context "descricao" do
      it "não pode ser vazia" do
        expect(build(:transacao, descricao: nil)).to_not be_valid
        expect(build(:transacao, descricao: "")).to_not be_valid
      end

      it "não pode ter mais de 10 caracteres" do
        expect(build(:transacao, descricao: "123456789 e mais um pouco")).to_not be_valid
      end
    end

    context "valor" do
      it "não pode ser float" do
        expect(build(:transacao, valor: 1.1)).to_not be_valid
      end
    end

    context "tipo" do
      it "não pode ser diferente de d e c" do
        expect(build(:transacao, tipo: "x")).to_not be_valid
      end
    end
  end
end
