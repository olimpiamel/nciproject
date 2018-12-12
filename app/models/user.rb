class User < ApplicationRecord
# Establishes a relationship between users and the properties posted by them, the comments written by them and the conversations they hold
  has_many :properties, dependent: :destroy
  has_many :comments, through: :properties
  has_many :conversations, :foreign_key => :sender


  before_save { email.downcase! }
# All data entered in the sign in for will be a required field to be alloud to create an account, other rules for data control introduced
  validates :name, presence: true, length: {maximum: 20}
  validates :surname, presence: true, length: {maximum: 30}
  validates :address, presence: true
  validates :phone, presence: true, length: { in: 5..10 }
  # password validation
  has_secure_password
  validates :password, presence: true, on: :create, length: {maximum: 15}, allow_nil: true

  # Email validation constant to allow only valid emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false},
  presence: true, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}




  # Returns the hash digest of the given string.
 def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
 end

# allows user to be associated with mailboxer gem and the messaging system
 acts_as_messageable

 def mailboxer_name
   self.name
 end

 def mailboxer_email(object)
   self.email
 end


end
