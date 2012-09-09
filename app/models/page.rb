class Page < ActiveRecord::Base
  attr_accessible :content, :published_on, :title
end
