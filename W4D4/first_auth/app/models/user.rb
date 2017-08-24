class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: {message: 'No make blank!'}
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token #return token
  end

  # def is_password?(password)
  #   BCrypt::Password.new(self.password_digest).is_password?(password)
  # end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil #not found
  end



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
