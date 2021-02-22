require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'nicknameとemailとpasswordとpassword_confirmationとfirst_name1とlast_name1とfrist_name2とlast_name2とbirthdayが存在すれば登録できる'do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下の場合は登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_name1が空では登録できない' do
        @user.first_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name1 can't be blank")
      end

      it 'first_name1が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name1 = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name1 is invalid")
      end

      it 'last_name1が空では登録できない' do
        @user.last_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name1 can't be blank")
      end

      it 'last_name1が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name1 = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name1 is invalid")
      end

      it 'first_name2が空では登録できない' do
        @user.first_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 can't be blank")
      end
      
      it 'first_name2が全角（カタカナ）以外では登録できない' do
        @user.first_name2 = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 is invalid")
      end

      it 'last_name2が空では登録できない' do
        @user.last_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 can't be blank")
      end

      it 'last_name2が全角（カタカナ）以外では登録できない' do
        @user.last_name2 = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
