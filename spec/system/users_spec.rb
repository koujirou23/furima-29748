require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name',  with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana',  with: @user.last_name_reading
      fill_in 'first-name-kana', with: @user.first_name_reading
      select '1990', from: 'user_birthday_1i'
      select '1', from: 'user_birthday_2i'
      select '1', from: 'user_birthday_3i'
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      fill_in 'last-name',  with: ''
      fill_in 'first-name', with: ''
      fill_in 'last-name-kana',  with: ''
      fill_in 'first-name-kana', with: ''
      select '--', from: 'user_birthday_1i'
      select '--', from: 'user_birthday_2i'
      select '--', from: 'user_birthday_3i'
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq new_user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ログインができるとき' do
    it '正しい情報を入力すればログインができてトップページに移動する' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンをクリックする
      click_on('ログイン')
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ログインができないとき' do
    it '誤った情報ではログインができずにログインページへ戻ってくる' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # 新規登録ページへ移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      # ログインボタンをクリックする
      click_on('ログイン')
      # ログインページへ遷移することを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end
