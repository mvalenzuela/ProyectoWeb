class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :edit_permissions
  has_many :documents, through: :edit_permissions
  has_many :likes
  has_many :liked_document, through: :likes

  validates :first_name, length: { minimum: 3,  maximum: 30 }, presence: true
  validates :last_name, length: { minimum: 3,  maximum: 30 }, presence: true

  validates :email, {
  email: true,
  length: { minimum: 3,  maximum: 50 },
  presence: true,
  uniqueness: true,
  confirmation: true
  }

  def to_s
    if first_name and last_name
      return first_name + ' ' + last_name
    else
      return ''
    end
  end

end
