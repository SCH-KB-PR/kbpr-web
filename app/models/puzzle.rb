class Puzzle < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :release
  has_rich_text :description
  has_many :puzzle_solutions, dependent: :destroy

  
end