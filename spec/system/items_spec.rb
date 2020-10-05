require 'rails_helper'

RSpec.describe "新規出品", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  context '新規出品ができるとき', js: true do
    it '正しい情報を入力すれば新規出品ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      #ログインする
      sign_in(@user)
      # トップページに新規出品ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('出品する')
      # 新規出品ページへ移動する
      visit new_item_path
      #商品情報を入力する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('item-image', image_path)
      fill_in 'item-name',  with: @item.name
      fill_in 'item-info',  with: @item.text
      select 'レディース', from: 'item-category'
      select '新品、未使用', from: 'item-sales-status'
      select '着払い(購入者負担)', from: 'item-shipping-fee-status'
      select '北海道', from: 'item-prefecture'
      select '1~2日で発送', from: 'item-scheduled-delivery'
      fill_in 'item-price', with: @item.price
      #販売手数料と販売利益が反映しているか確認
      expect(page).to have_selector ".price-content"
      #出品するボタンを押すとitemモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      #トップページに遷移することを確認
      expect(current_path).to eq root_path
      #先程出品した商品が存在することを確認
      expect(page).to have_selector("img")
      #先程出品した商品情報があることを確認する
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.price)
    end

    context '新規出品ができないとき' do
      it '正しい情報を入力しないときは出品ページへ戻される' do
        # トップページに移動する
        visit root_path
        #ログインする
        sign_in(@user)
        # トップページに新規出品ページへ遷移するボタンがあることを確認する
        expect(page).to have_content('出品する')
        # 新規出品ページへ移動する
        visit new_item_path
        #商品情報を入力する
        fill_in 'item-name',  with: ""
        fill_in 'item-info',  with: ""
        select '--', from: 'item-category'
        select '--', from: 'item-sales-status'
        select '--', from: 'item-shipping-fee-status'
        select '--', from: 'item-prefecture'
        select '--', from: 'item-scheduled-delivery'
        fill_in 'item-price', with: ""
        #出品ボタンをクリックする
        click_on("出品する")
        #出品ページへ遷移することを確認する
        expect(current_path).to eq items_path
      end
    end

    context '新規出品ができないとき' do
      it 'ログインしていないと出品できない時' do
        # トップページに移動する
        visit root_path
        # トップページに新規出品ページへ遷移するボタンがあることを確認する
        expect(page).to have_content('出品する')
        # 新規出品ページへ移動する
        visit new_item_path
        #ログインページへ遷移することを確認する
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end

