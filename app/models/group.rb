class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_and_belongs_to_many :projects

  validates :name, presence: true, length: { maximum: 20 }
  validates :icon, presence: true
end
