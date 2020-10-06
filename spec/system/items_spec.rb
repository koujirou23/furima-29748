require 'rails_helper'

# RSpec.describe "新規出品", type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#     @item = FactoryBot.build(:item)
#   end
#   context '新規出品ができるとき', js: true do
#     it '正しい情報を入力すれば新規出品ができてトップページに移動する' do
#       # トップページに移動する
#       visit root_path
#       #ログインする
#       sign_in(@user)
#       # トップページに新規出品ページへ遷移するボタンがあることを確認する
#       expect(page).to have_content('出品する')
#       # 新規出品ページへ移動する
#       visit new_item_path
#       #商品情報を入力する
#       image_path = Rails.root.join('public/images/test_image.png')
#       attach_file('item-image', image_path)
#       fill_in 'item-name',  with: @item.name
#       fill_in 'item-info',  with: @item.text
#       select 'レディース', from: 'item-category'
#       select '新品、未使用', from: 'item-sales-status'
#       select '着払い(購入者負担)', from: 'item-shipping-fee-status'
#       select '北海道', from: 'item-prefecture'
#       select '1~2日で発送', from: 'item-scheduled-delivery'
#       fill_in 'item-price', with: @item.price
#       #販売手数料と販売利益が反映しているか確認
#       expect(page).to have_selector ".price-content"
#       #出品するボタンを押すとitemモデルのカウントが1上がることを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Item.count }.by(1)
#       #トップページに遷移することを確認
#       expect(current_path).to eq root_path
#       #先程出品した商品が存在することを確認
#       expect(page).to have_selector("img")
#       #先程出品した商品情報があることを確認する
#       expect(page).to have_content(@item.name)
#       expect(page).to have_content(@item.price)
#     end

#     context '新規出品ができないとき' do
#       it '正しい情報を入力しないときは出品ページへ戻される' do
#         # トップページに移動する
#         visit root_path
#         #ログインする
#         sign_in(@user)
#         # トップページに新規出品ページへ遷移するボタンがあることを確認する
#         expect(page).to have_content('出品する')
#         # 新規出品ページへ移動する
#         visit new_item_path
#         #商品情報を入力する
#         fill_in 'item-name',  with: ""
#         fill_in 'item-info',  with: ""
#         select '--', from: 'item-category'
#         select '--', from: 'item-sales-status'
#         select '--', from: 'item-shipping-fee-status'
#         select '--', from: 'item-prefecture'
#         select '--', from: 'item-scheduled-delivery'
#         fill_in 'item-price', with: ""
#         #出品ボタンをクリックする
#         click_on("出品する")
#         #出品ページへ遷移することを確認する
#         expect(current_path).to eq items_path
#       end
#     end

#     context '新規出品ができないとき' do
#       it 'ログインしていないと出品できない時' do
#         # トップページに移動する
#         visit root_path
#         # トップページに新規出品ページへ遷移するボタンがあることを確認する
#         expect(page).to have_content('出品する')
#         # 新規出品ページへ移動する
#         visit new_item_path
#         #ログインページへ遷移することを確認する
#         expect(current_path).to eq new_user_session_path
#       end
#     end
#   end
# end

# RSpec.describe "商品編集", type: :system do
#   before do
#     @item1 = FactoryBot.create(:item)
#     @item2 = FactoryBot.create(:item)
#   end
#   context '商品編集できるとき', js: true do
#     it 'ログインしたユーザーは自分が出品した商品の編集ができる' do
#       #ログインする
#       sign_in(@item1.user)
#       #商品詳細ページへ遷移する
#       visit item_path(@item1)
#       #編集ボタンがあることを確認する
#       expect(page).to have_content("商品の編集")
#       #商品編集ページへ遷移する
#       visit edit_item_path(@item1)
#       #すでに入力した商品情報があることを確認する
#       expect(
#         find('#item-name').value
#       ).to eq @item1.name
#       expect(
#         find('#item-info').value
#       ).to eq @item1.text
#       expect(
#         find('#item-category').value.to_i
#       ).to eq @item1.category_id
#       expect(
#         find('#item-sales-status').value.to_i
#       ).to eq @item1.status_id
#       expect(
#         find('#item-shipping-fee-status').value.to_i
#       ).to eq @item1.delivery_fee_id
#       expect(
#         find('#item-prefecture').value.to_i
#       ).to eq @item1.area_id
#       expect(
#         find('#item-scheduled-delivery').value.to_i
#       ).to eq @item1.day_id
#       expect(
#         find('#item-price').value.to_i
#       ).to eq @item1.price
#       #商品情報を入力する
#       image_path = Rails.root.join('public/images/test_image.png')
#       attach_file('item-image', image_path)
#       fill_in 'item-name',  with: "#{@item1.name}+編集したなまえ"
#       fill_in 'item-info',  with: "#{@item1.text}+編集したテキスト"
#       select 'メンズ', from: 'item-category'
#       select '未使用に近い', from: 'item-sales-status'
#       select '送料込み(出品者負担)', from: 'item-shipping-fee-status'
#       select '青森', from: 'item-prefecture'
#       select '4~7日で発送', from: 'item-scheduled-delivery'
#       fill_in 'item-price', with: 5000
#       #販売手数料と販売利益が反映しているか確認
#       expect(page).to have_selector ".price-content"
#       #編集してもItemもでるのカウントが変わらないことを確認
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Item.count }.by(0)
#       #商品詳細画面へ遷移したことを確認
#       expect(current_path).to eq item_path(@item1)
#       #先程変更した内容が存在するのかを確認
#       expect(page).to have_selector("img")
#       expect(page).to have_content( @item1.name )
#       expect(page).to have_content( @item1.text )
#       expect(page).to have_selector ".detail-value"
#     end

    #   it 'ログインしたユーザーは自分が出品した商品の編集ができる(情報の変更なしで)' do
    #     #ログインする
    #     sign_in(@item1.user)
    #     #商品詳細ページへ遷移する
    #     visit item_path(@item1)
    #     #編集ボタンがあることを確認する
    #     expect(page).to have_content("商品の編集")
    #     #商品編集ページへ遷移する
    #     visit edit_item_path(@item1)
    #     #すでに入力した商品情報があることを確認する
    #     expect(
    #       find('#item-name').value
    #     ).to eq @item1.name
    #     expect(
    #       find('#item-info').value
    #     ).to eq @item1.text
    #     expect(
    #       find('#item-category').value.to_i
    #     ).to eq @item1.category_id
    #     expect(
    #       find('#item-sales-status').value.to_i
    #     ).to eq @item1.status_id
    #     expect(
    #       find('#item-shipping-fee-status').value.to_i
    #     ).to eq @item1.delivery_fee_id
    #     expect(
    #       find('#item-prefecture').value.to_i
    #     ).to eq @item1.area_id
    #     expect(
    #       find('#item-scheduled-delivery').value.to_i
    #     ).to eq @item1.day_id
    #     expect(
    #       find('#item-price').value.to_i
    #     ).to eq @item1.price
    #     #販売手数料と販売利益が反映しているか確認
    #     expect(page).to have_selector ".price-content"
    #     #編集してもItemもでるのカウントが変わらないことを確認
    #     expect{
    #       find('input[name="commit"]').click
    #     }.to change { Item.count }.by(0)
    #     #商品詳細画面へ遷移したことを確認
    #     expect(current_path).to eq item_path(@item1)
    #     #先程変更した内容が存在するのかを確認
    #     expect(page).to have_selector("img")
    #     expect(page).to have_content( @item1.name )
    #     expect(page).to have_content( @item1.text )
    #     expect(page).to have_selector ".detail-value"
    #   end
    #  end

    # context '商品編集できないとき' do
    #   it '出品者ではないユーザーは商品の編集画面へ遷移できない' do
    #     #ログインする
    #     sign_in(@item2.user)
    #     #商品詳細ページへ遷移する
    #     visit item_path(@item1)
    #     #編集ボタンがないことを確認する
    #     expect(page).to have_no_content("商品の編集")
    #   end
    #   it 'ログインしていないユーザーは編集画面へ遷移できない' do
    #     #商品詳細ページへ遷移する
    #     visit item_path(@item1)
    #     #編集ボタンがないことを確認する
    #     expect(page).to have_no_content("商品の編集")
    #   end
    # end
# end

RSpec.describe "商品削除", type: :system do
    before do
       @item1 = FactoryBot.create(:item)
       @item2 = FactoryBot.create(:item)
    end
    context '商品削除できるとき' do
      it 'ログインしたユーザーは自分が出品した商品の削除ができる' do
       #ログインする
       sign_in(@item1.user)
       #商品詳細ページへ遷移する
       visit item_path(@item1)
       #編集ボタンがあることを確認する
       expect(page).to have_content("削除")
       #削除ボタンクリックする
       click_on ('削除')
       #トップページに遷移することを確認する
       expect(current_path).to eq root_path
      end
    end

    context '商品削除できない時' do
      it '商品出品者ではないとき' do
        #ログインする
        sign_in(@item1.user)
        #商品詳細ページへ遷移する
        visit item_path(@item2)
        #編集ボタンがないことを確認する
        expect(page).to have_no_content("削除")
      end

      it 'ログインしていないユーザーには削除ボタンが無い' do
        #商品詳細ページへ遷移する
        visit item_path(@item1)
        #編集ボタンがないことを確認する
        expect(page).to have_no_content("削除")
      end
    end
end

