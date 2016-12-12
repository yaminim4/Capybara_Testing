class User < ActiveRecord::Base
  # validates :username, :password_digest, :session_token, presence: true
  # validates :password, length: {minimum: 6, allow_nil: true}
  #
  # attr_reader :password
  #
  # def self.find_by_credentials(username, password)
  #
  #   user = User.find_by(username: username)
  #   return nil unless user && user.valid_password?(password)
  #
  #   user
  # end
  #
  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end
  #
  # def valid_password?(password)
  #   test_pass = BCrypt::Password.new(self.password_digest)
  #   test_pass.is_password?(password)
  # end
end
