class User < ActiveRecord::Base
  has_many :tasks

  validates :email, uniqueness: true
end