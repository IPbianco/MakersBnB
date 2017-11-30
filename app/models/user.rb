require 'bcrypt'

class User
  attr_reader :password

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :hashed_password, Text

  has n, :rentals

  def password=(password)
    self.hashed_password = BCrypt::Password.create(password)
  end
end
