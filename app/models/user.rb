class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }

  with_options presence: true do
    validates :nickname

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\z/i.freeze

    validates :email,              uniqueness: true
    validates_format_of :email,    with: VALID_EMAIL_REGEX

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

    validates :family_name,        format: { with: NAME_REGEX }
    validates :first_name,         format: { with: NAME_REGEX }

    NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze

    validates :family_name_kana,   format: { with: NAME_KANA_REGEX }
    validates :first_name_kana,    format: { with: NAME_KANA_REGEX }
    validates :birthday
  end
end
