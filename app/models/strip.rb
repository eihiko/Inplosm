class Strip < ActiveRecord::Base
  belongs_to :comic
  has_many :tags, dependent: :destroy

  def generate_tag tag_type
    #Use the tag if it already exists
    tag = tags.joins(:tag_type).where(tag_types: {type: tag_type}).first
    return tag if tag

    #Otherwise, make a new one. (Also make a new tag type if necessary)
    tag_type = TagType.where(type: tag_type).first
    tag_type ||= TagType.create!(type: tag_type)
    return tags.create!(tag_type_id: tag_type.id)
  end
end
