class CreateMaReasonSlots < ActiveRecord::Migration
  def change
    create_table :ma_reason_slots do |t|
      t.string :position
      t.text :description

      t.timestamps
    end
  end
end
