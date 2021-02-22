class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
      validates :nickname
      validates :birthday
      validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }

      with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
        validates :first_name1
        validates :last_name1
      end

      with_options  format: { with: /\A[ァ-ヶー－]+\z/ } do
        validates :first_name2
        validates :last_name2
      end
    end
    
    has_many :items
    has_many :buyers 
end
