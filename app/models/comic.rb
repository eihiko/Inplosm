class Comic < ActiveRecord::Base
  has_many :strips, dependent: :destroy

  def generate_strip number
    #If strip exists in database, return that.
    strip = strips.where(number: number).first
    return strip if strip

    #Otherwise, check the comic's site for this strip.
    response = HTTParty.get(self.url + number.to_s)

    #If there is no page for this strip at the site, don't create the strip.
    if response.code >= 400
      return nil
    end
    
    #If there is a page for this strip and this site doesn't have custom error messages, create the strip.
    unless not_found_regex
      return strips.create!(number: number)
    end

    #If the custom error message is being displayed, don't create the strip.
    regex = Regexp.new not_found_regex
    if regex === response.body
      return nil
    end
    
    #If the custom error isn't being displayed, then this strip exists, so create one.
    return strips.create!(number: number)
  end
end
