class Music < ApplicationRecord
    has_many :likes
    has_many :users, through: :likes
    has_many :commentons
    has_many :comments, through: :commentons, dependent: :destroy
end
