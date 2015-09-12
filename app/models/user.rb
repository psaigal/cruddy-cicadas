class User < ActiveRecord::Base
  has_many :tasks

  validates :email, unique: true
end