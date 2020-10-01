require 'rails_helper'
RSpec.describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, email, password, password_confirmation, family_name_kanji, first_name_kanji, family_name_kana, first_name_kana, birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "aaaa111"
        @user.password_confirmation = "aaaa111"
        expect(@user).to be_valid
      end

      it "emailに@が入っていれば登録できる" do
        @user.email = "aa@aaa"
        expect(@user).to be_valid
      end

      it "family_name_kanjiが全角(漢字・ひらがな・カタカナ)のとき" do
        @user.family_name_kanji = "田中タナカたなか"
        expect(@user).to be_valid
      end

      it "first_name_kanjiが全角(漢字・ひらがな・カタカナ)のとき" do
        @user.first_name_kanji = "太郎タロウたろう"
        expect(@user).to be_valid
      end

      it "family_name_kanaが全角(カタカナ)のとき" do
        @user.family_name_kana = "タナカ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角(カタカナ)のとき" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end


      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空だと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailが重複していると登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "emailに@がないと登録できない" do
          @user.email = "aaaaaa.aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空だと登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "password_confirmationが空だと登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "password_confirmationがpasswordと同じでないと登録できない" do
          @user.password = "aaaa111"
          @user.password_confirmation = "bbbb111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが５文字以下だと登録できない" do
          @user.password = "aa000"
          @user.password_confirmation = "aa000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordは半角英数字混合でなければ登録できない" do
          @user.password = "1111111"
          @user.password_confirmation = "1111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end


        it "family_name_kanjiが空だと登録できない" do
          @user.family_name_kanji = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
        end

        it "first_name_kanjiが空だと登録できない" do
          @user.first_name_kanji = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kanji can't be blank")
        end

        it "family_name_kanaが空だと登録できない" do
          @user.family_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it "first_name_kanaが空だと登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "family_name_kanjiが全角(漢字・ひらがな・カタカナ)以外だと登録できない" do
          @user.family_name_kanji = "aaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kanji は全角(漢字・ひらがな・カタカナ)で入力してください。")
        end

        it "first_name_kanjiが全角(漢字・ひらがな・カタカナ)以外だと登録できない" do
          @user.first_name_kanji = "aaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kanji は全角(漢字・ひらがな・カタカナ)で入力してください。")
        end

        it "family_name_kanaが全角(カタカナ)以外だと登録できない" do
          @user.family_name_kana = "あああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana は全角(カタカナ)で入力して下さい。")
        end

        it "first_name_kanaが全角(カタカナ)以外だと登録できない" do
          @user.first_name_kana = "あああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana は全角(カタカナ)で入力して下さい。")
        end

        it "birthdayが空だと登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
    end
  end
end
