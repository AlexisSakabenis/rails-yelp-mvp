class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # ---> # besoin de dependent pour pouvoir supprimer les reviews assoscié

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }
end
