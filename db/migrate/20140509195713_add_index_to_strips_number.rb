class AddIndexToStripsNumber < ActiveRecord::Migration
  change_table :strips do |t|
    t.index :number
  end
end
