require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、ユーザー本名の苗字と名前、各フリガナが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = 'abc123'
          @user.password_confirmation = 'abc123'
          expect(@user).to be_valid
        end
        it 'passwordが半角英数混合であれば登録できる' do
          @user.password = 'abc123'
          @user.password_confirmation = 'abc123'
          expect(@user).to be_valid
        end
        it 'ユーザー本名がそれぞれ全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.family_name = '書きくけ子'
          @user.first_name = '書きくけ子'
          @user.family_name_kana = 'カキクケコ'
          @user.first_name_kana = 'カキクケコ'
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passswordが5文字以下であれば登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordとpassword_confirmationの両方がないと登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'family_nameが空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it 'family_nameに小文字が混合すると登録できない' do
          @user.family_name = 'あa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameに小文字が混合すると登録できない' do
          @user.first_name = 'あa'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end
        it 'family_name_kanaが空だと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it 'family_name_kanaに英数字、漢字、ひらがな、半角が混合すると登録できない' do
          @user.family_name_kana = 'あa阿'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana カタカナを使用してください')
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'first_name_kanaに英数字、漢字、ひらがな、半角が混合すると登録できない' do
          @user.first_name_kana = 'あa阿'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana カタカナを使用してください')
        end
      end
    end
  end
end