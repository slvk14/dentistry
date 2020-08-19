class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.string :name
      t.integer :duration_min
      t.integer :price_uah
    end
  end
end
