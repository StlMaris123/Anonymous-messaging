# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#  address    :text
#
class Message < ApplicationRecord
    scope :order_by_creation_date, -> { order(created_at: :desc)}
    has_many :comments, as: :commentable#, :order => 'created_at DESC'
    before_validation :generate_random_latitude_and_longitude

    geocoded_by :address
    # Use latitude and longitude to find the location
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode

    private

    def generate_random_latitude_and_longitude
        self.latitude = rand(1.0..90.0)
        self.longitude = rand(1.0..180.0)
    end
end
