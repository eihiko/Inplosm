class CreateStrips < ActiveRecord::Migration
  def change
    create_table :strips do |t|
      t.string :url
      t.belongs_to :comic, index: true

      t.timestamps
    end
  end
end
