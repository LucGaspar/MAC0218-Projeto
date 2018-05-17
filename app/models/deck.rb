class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
  validates_uniqueness_of :name, :scope =>[:user_id]


  def random_card
    cards.all[rand(cards.all.size)]
  end
end
