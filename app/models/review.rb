class Review < ApplicationRecord
  belongs_to :project

  validates :commenter, presence: true
  validates :body, presence: true
end
