class Group < ApplicationRecord
    belongs_to  :user
    has_one_attached :icon
    has_and_belongs_to_many :projects
end
