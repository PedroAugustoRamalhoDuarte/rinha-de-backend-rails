class CreateTransacoes < ActiveRecord::Migration[7.1]
  def change
    create_table :transacoes do |t|
      t.integer :valor
      t.integer :tipo
      t.string :descricao
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
