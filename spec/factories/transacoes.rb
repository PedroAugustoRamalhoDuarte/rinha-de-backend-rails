FactoryBot.define do
  factory :transacao do
    valor { 1 }
    tipo { 1 }
    descricao { "MyString" }
    cliente { nil }
  end
end
