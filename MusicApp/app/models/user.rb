class User < ActiveRecord::Base
  
  attr_reader :password
  
  after_initialize :ensure_session_token
  
  validates :email, presence: true, uniqeness: true
  validates :session_token, presence: true, uniqeness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
  
  def generate_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.seession_token
  end
  
  def reset_session_token!
    generate_session_token!
  end
  
  def ensure_session_token
    self.session_token ||= generate_session_token
  end
  
  def password=(password)
    return unless password.present?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
end
