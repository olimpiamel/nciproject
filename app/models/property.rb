class Property < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :address, presence: true, uniqueness: true, length: {in: 10..50}
  validates :description, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :price, presence: true, length: {minimum: 1}
  validates :user_id, presence: true
  validates :images, file_size: {less_than: 8.megabytes}

  mount_uploaders :images, ImagesUploader
  serialize :images, JSON


end
