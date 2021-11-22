class Schedule < ApplicationRecord
    belongs_to :movie , optional: true
end
