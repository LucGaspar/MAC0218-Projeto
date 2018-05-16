class Deck < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {minimum: 5}
  validates_uniqueness_of :name, :scope =>[:user_id]
end
