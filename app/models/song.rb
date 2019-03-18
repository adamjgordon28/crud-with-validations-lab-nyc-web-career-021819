require "date"

class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: {in: [true,false]}
  validates :artist_name, uniqueness: { scope: :release_year, message: "Can't release same song more than once per year"}

  with_options if: :released do |song|
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    song.validates :release_year, presence: true
  end

end
