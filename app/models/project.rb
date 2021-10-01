class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  has_many :reviews

  validates :name, presence: true
  validates :amount, presence: true
end
