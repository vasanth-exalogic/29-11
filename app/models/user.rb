class User < ApplicationRecord
  has_secure_password
  validates :fname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :lname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :ename, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates_uniqueness_of :email
end
