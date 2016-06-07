class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_tags
  has_many :tags, :through => :post_tags

  def author_name=(name)
    self.author = Author.find_or_create_by(:name => name)
  end
end