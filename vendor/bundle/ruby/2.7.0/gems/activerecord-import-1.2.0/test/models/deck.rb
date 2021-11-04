class Deck < ActiveRecord::Base
  has_many :cards
  def self.polymorphic_name
    "PlayingCard"
  end
end
