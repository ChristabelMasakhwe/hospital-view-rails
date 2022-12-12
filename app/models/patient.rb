class Patient < ApplicationRecord
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: {minimum: 8}
    has_secure_password
    has_many :admissions
    has_many :hospitals, through: :admissions
end
