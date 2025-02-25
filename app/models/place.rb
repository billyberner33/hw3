class Place < ApplicationRecord
  has_many :entries, dependent: :destroy
  validates :name, presence: true  # Prevents empty names
end