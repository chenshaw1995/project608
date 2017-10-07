class Music < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes
    has_many :commentons, dependent: :destroy
    has_many :comments, through: :commentons, dependent: :destroy
end
