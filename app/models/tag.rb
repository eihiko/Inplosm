class Tag < ActiveRecord::Base
  belongs_to :strip
  belongs_to :tag_type

  def upvote
    votes += 1
    save!
  end

  def downvote
    votes -= 1
    save!
  end


end
