class Badge < ApplicationRecord
    has_many :grants
    has_many :users, through: :grants
    has_many :budge_rules
    has_many :rules, through: :budge_rules
end
