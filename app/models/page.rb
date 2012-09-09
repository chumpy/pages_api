class Page < ActiveRecord::Base
  attr_accessible :content, :published_on, :title
  scope :published, where("published_on <= :current_datetime", current_datetime: DateTime.current).order("published_on DESC") 
  scope :unpublished, where("published_on IS NULL or published_on > :current_datetime", current_datetime: DateTime.current).order("published_on DESC") 
  validates_uniqueness_of :title

  def total_words
    title.scan(/\w+/).size + content.scan(/\w+/).size
  end
end
