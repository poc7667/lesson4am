class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :publish_date
      t.text :prizes
      t.timestamps
      add_index ["publish_date", "prizes"], :unique => true
    end
  end
end
