class Reservation < ApplicationRecord
    validates :sheet_id, uniqueness: { scope: [:schedule_id, :date] }
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}
end
