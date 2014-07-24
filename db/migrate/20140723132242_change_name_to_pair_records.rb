class ChangeNameToPairRecords < ActiveRecord::Migration
  def change
    rename_column :pair_records, :condition, :pair_setting
    rename_column :pair_records, :record , :pair_result
  end
end
