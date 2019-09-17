class Micropost < ApplicationRecord
  belongs_to :user
  scope :news_feed, ->{order created_at: :desc}
  scope :feed_by_id, ->(id){where user_id: id}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.maximum_micropost}
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    return unless picture.size > Settings.max_size_picture.megabytes
    errors.add(:picture, t("model.micropost.size_image"))
  end
end
