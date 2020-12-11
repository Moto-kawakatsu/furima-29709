class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :orders
         has_many :comments
         has_many :likes, dependent: :destroy
         has_many :liked_items, through: :likes, source: :item

         def already_liked?(item)
            self.likes.exists?(item_id: item.id)
         end

        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i
      
        kanji = /\A[ぁ-んァ-ン一-龥]/
        kana = /\A[ァ-ヶー－]+\z/
        kanji_message = "は全角(漢字・ひらがな・カタカナ)で入力してください。"
        kana_message = "は全角(カタカナ)で入力して下さい。"

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
