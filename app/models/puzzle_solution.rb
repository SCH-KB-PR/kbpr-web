class PuzzleSolution < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :puzzle
  has_rich_text :description
end