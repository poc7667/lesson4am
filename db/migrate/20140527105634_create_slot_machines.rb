class CreateSlotMachines < ActiveRecord::Migration
  def change
    create_table :slot_machines do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
