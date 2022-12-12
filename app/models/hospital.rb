class Hospital < ApplicationRecord
    has_many :admissions
    has_many :patients, through: :admissions
end
