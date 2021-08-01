class Courier < ApplicationRecord
    has_many :packages, dependent: :destroy
end
