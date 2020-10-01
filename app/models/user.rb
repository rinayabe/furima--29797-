class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: %w(@)}
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-z\d]+\z/}, confirmation: true
  validates :family_name, presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/}
  validates :birthday, presence: true

end
