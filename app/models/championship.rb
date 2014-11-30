class Championship < ActiveRecord::Base
  validates :name, presence: true

  scope :recents, -> { order(created_at: :desc) }

  has_many :scores, dependent: :destroy
  has_many :games, dependent: :destroy
end