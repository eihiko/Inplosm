class Tag < ActiveRecord::Base
  belongs_to :strip
  belongs_to :tag_type
end
