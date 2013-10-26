class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings, :dependent => :destroy
  has_many :articles, :through => :taggings

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
end
