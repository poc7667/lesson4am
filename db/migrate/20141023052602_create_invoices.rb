class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :publish_date
      t.text :prizes

      t.timestamps
    end
  end
end
