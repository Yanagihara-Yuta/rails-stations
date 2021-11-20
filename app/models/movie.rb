class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :id, uniqueness: true
    validates :name,    length: { maximum: 160 }
    validates :year,    length: { maximum: 45 }
    validates :is_showing,    numericality: {greater_than: -1,less_than: 2}
    validates :image_url,    length: { maximum: 150 }
    has_many :schedules , dependent: :destroy
end
