class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest, type: String
  has_secure_password

  validates :email, :password, presence: true, on: :create
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
