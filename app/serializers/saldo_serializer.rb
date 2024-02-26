class SaldoSerializer < Panko::Serializer
  attributes :total, :limite, :data_extrato

  def total
    object.saldo
  end

  def data_extrato
    Time.zone.now
  end
end
