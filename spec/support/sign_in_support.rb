module SignInSupport
  def sign_in(user)
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # トップページに移動する
    visit root_path
    # トップページにログインページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # ログインページへ移動する
    visit new_user_session_path
    # ユーザー情報を入力する
    fill_in 'email',  with: @user.email
    fill_in 'password', with: @user.password
    # ログインボタンをクリックする
    click_on("ログイン")
    # トップページへ遷移することを確認する
    expect(current_path).to eq root_path
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('ログイン')
    expect(page).to have_no_content('新規登録')
  end
end