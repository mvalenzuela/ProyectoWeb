class User < ApplicationRecord

  validates :first_name, length: { minimum: 3,  maximum: 30 }, presence: true
  validates :last_name, length: { minimum: 3,  maximum: 30 }, presence: true

  validates :email, {
  email: true,
  length: { minimum: 3,  maximum: 50 },
  presence: true,
  uniqueness: true,
  confirmation: true
  }
  
end
