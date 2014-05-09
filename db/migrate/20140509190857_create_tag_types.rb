class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
