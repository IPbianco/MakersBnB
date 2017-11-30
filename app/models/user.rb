require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :hashed_password, Text
  validates_confirmation_of :password
  has n, :rentals

  def password=(password)
    @password = password
    self.hashed_password = BCrypt::Password.create(password)
  end
end
