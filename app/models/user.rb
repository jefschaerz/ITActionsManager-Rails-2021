class User < ApplicationRecord
  
  has_secure_password
  
  validates :username, 
    format: {with: /\A[a-zA-z0-9_]{3,25}\z/, message: 'ne doit conternie que des caractères alphanumériques ou des _'},
    uniqueness: {case_sensitive: false}

  validates :email, 
    format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
    uniqueness: {case_sensitive: false}
 
    # Avoid repetition
    def to_session
      {id: id}  
    end

    # Returns the hash digest of the given string. For seed
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end

end
