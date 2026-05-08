class User < ApplicationRecord
  has_many :articles

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end