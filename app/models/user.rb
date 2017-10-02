class User < ApplicationRecord
    has_many :likes
    has_many :musics, through: :likes
    has_many :comments
    has_many :musics, through: :comments
end
