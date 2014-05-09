class ChangeStripsUrl < ActiveRecord::Migration
  change_table :strips do |t|
    t.remove :url
    t.integer :number
  end
end
