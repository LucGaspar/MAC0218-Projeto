class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
  validates_uniqueness_of :name, :scope =>[:user_id]

  def ozniak
    list = Array.new
    cards.shuffle.each do |card|
      e_factor = card[:e_factor]
      n_days = card[:n_days]
      date = card[:played_at]
      if (n_days == 0)
        pn = 0
      elsif (n_days == 1)
        pn = 1
      else
        pn = 7 + e_factor ** (n_days - 2)
      end

      if ((date.beginning_of_day + 86400 * pn.round).to_date <= Time.now.beginning_of_day.to_date || pn == 0)
        list << card
      end
    end
    return list[0]
  end

end
