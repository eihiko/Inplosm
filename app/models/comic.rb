class Comic < ActiveRecord::Base
  has_many :strips, dependent: :destroy
end
