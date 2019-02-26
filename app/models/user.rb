class User < ActiveRecord::Base

  has_secure_password
  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } 
  validates :password, length: { minimum: 10 }

# sef defined on class
  def self.authenticate_with_credentials(email, password)
    if user = User.find_by(email: email)
      user.authenticate(password)
    end
  
  end

end
 
