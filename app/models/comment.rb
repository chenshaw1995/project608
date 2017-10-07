class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :music
    has_one :author
    has_one :commenton
    
end
