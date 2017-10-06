class User < ApplicationRecord
    has_many :likes
    has_many :musics, through: :likes
    has_many :authors
    has_many :comments, through: :authors
end
