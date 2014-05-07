class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :strip, index: true
      t.belongs_to :tag_type, index: true
      t.integer :votes
    end
  end
end
