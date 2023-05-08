class CreateQuotationItems < ActiveRecord::Migration[7.0]
  def change
    create_table :quotation_items do |t|
      t.references :quotation, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
