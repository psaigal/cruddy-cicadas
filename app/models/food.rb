class Food < ActiveRecord::Base
  validates :name, presence: true
  validates :glycemic_index, presence: true
  has_many :users_foods
  has_many :users, through: :users_foods
  end

