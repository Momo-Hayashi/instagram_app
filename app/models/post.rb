class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, length: { minimum: 1 }
  belongs_to :user
end
