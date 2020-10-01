class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :purchases
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{1,50}+\z/
        validates :password, presence: true, length: {minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
         validates :email, presence: true
         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :family_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
         validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
         validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}

end
