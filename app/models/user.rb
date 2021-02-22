class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  
    validates :first_name1, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :last_name1, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }

    validates :first_name2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true

    has_many :items
    has_many :buyers 
end
