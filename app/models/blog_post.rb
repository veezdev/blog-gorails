class BlogPost < ApplicationRecord
  # validations to ensure that the title and body are present before saving the blog post to the database
  validates :title, presence: true
  validates :body, presence: true
end
