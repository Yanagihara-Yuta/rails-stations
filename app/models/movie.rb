class Movie < ApplicationRecord
    validates :name, uniqueness: true
    validates :name,    length: { maximum: 160 }
    validates :year,    length: { maximum: 45 }
    validates :is_showing,    length: { maximum: 1 }
    validates :image_url,    length: { maximum: 150 }
end
