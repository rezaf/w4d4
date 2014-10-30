class User < ActiveRecord::Base
  
  validates :email, presence: true, uniqeness: true
  validates :session_token, presence: true, uniqeness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  def self.find_by_credentials(email, password)
    
  end
  
  def generate_session_token
    self.session_token = BCrypt::SecureRandom.urs_safe.base64
  end
  
  def reset_session_token!
    
  end
  
  def ensure_session_token
    
  end
  
  def password=(password)
    
  end
  
  def is_password?(password)
  
  end
  
end
