class TransacoesSerializer < Panko::Serializer
  attributes :valor, :tipo, :descricao, :realizada_em

  def realizada_em
    object.created_at
  end
end
