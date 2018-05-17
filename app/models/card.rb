class Card < ApplicationRecord
  belongs_to :deck
  validates :front, presence:true, length:{minimum:5}
  validates :verse, presence:true, length:{minimum:5}
  validates :deck, :uniqueness => {:scope => :front, message: "Already a similar card in deck"}
end
