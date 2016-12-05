class User < ActiveRecord::Base
  has_many :posts

  validates :email, presence: true, uniqueness: true
  validates :username, :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plain_password)
    self.password == plain_password
  end
end
