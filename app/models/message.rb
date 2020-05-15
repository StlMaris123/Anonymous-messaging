class Message < ApplicationRecord
    has_many :comments, as: :commentable
end
