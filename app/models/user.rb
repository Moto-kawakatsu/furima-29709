class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :purchases


        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{1,50}+\z/
        kanji = /\A[ぁ-んァ-ン一-龥]/
        kana = /\A[ァ-ヶー－]+\z/
        kanji_message = "は全角で入力してください。"
        kana_message = "は全角カタカナで入力して下さい。"

       with_options presence: true do
          validates :password, length: {minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
          validates :email
          validates :nickname
          validates :birthday
          validates :family_name_kanji, format: { with: kanji , message: kanji_message}
          validates :first_name_kanji, format: { with: kanji, message: kanji_message}
          validates :family_name_kana, format: { with: kana, message: kana_message}
          validates :first_name_kana, format: { with: kana, message: kana_message}
       end
end
