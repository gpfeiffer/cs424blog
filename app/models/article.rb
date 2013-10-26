class Article < ActiveRecord::Base
  attr_accessible :body, :published_on, :title, :user_id, :tag_list

  has_many :comments, :dependent => :destroy
  belongs_to :user

  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings

  default_scope :order => :published_on

  def author
    user.email
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(:name => name.strip).first_or_create!
    end
  end
end
