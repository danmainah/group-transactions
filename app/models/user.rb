class User < ApplicationRecord
  has_many :projects, foreign_key: 'author_id', class_name: 'Project'
  has_many :groups

  validates :username, presence: true, length: { minimum: 5 }
end
