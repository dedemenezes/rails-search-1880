class Director < ApplicationRecord
  has_many :movies
  validates :first_name, :last_name, presence: true

  include PgSearch::Model
  multisearchable against: %i[first_name last_name]
end
