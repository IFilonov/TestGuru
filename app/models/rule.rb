class Rule < ApplicationRecord
    has_many :budge_rules
    has_many :badges, through: :budge_rules
end
