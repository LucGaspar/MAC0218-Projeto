class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
  validates_uniqueness_of :name, :scope =>[:user_id]


  def random_card
    group = cards.where("time_to_appear < '#{Time.now.change({ hour: 23, min: 59, sec: 59}).strftime("%Y-%m-%d %H:%M:%S")}'").order("time_to_appear ASC")
    if (!group.empty?)
    	return group.all[0]
    end
    
  end
end
