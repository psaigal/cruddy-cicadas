class User < ActiveRecord::Base
  include BCrypt
  has_many :users_foods
  has_many :foods, through: :users_foods

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
