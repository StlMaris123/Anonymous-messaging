# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  message          :text
#  commentable_type :string           not null
#  commentable_id   :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable#, :order => 'created_at DESC'  
end
