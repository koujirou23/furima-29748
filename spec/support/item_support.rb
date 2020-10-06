module ItemSupport
  def listing(item)
    # トップページに新規出品ページへ遷移するボタンがあることを確認する
    expect(page).to have_content('出品する')
    # 新規出品ページへ移動する
    visit new_item_path
    #商品情報を入力する
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('item-image', image_path)
    fill_in 'item-name',  with: "テスト"
    fill_in 'item-info',  with: "テストテキスト"
    select 'レディース', from: 'item-category'
    select '新品、未使用', from: 'item-sales-status'
    select '着払い(購入者負担)', from: 'item-shipping-fee-status'
    select '北海道', from: 'item-prefecture'
    select '1~2日で発送', from: 'item-scheduled-delivery'
    fill_in 'item-price', with: 2000
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
    expect(page).to have_content("テスト")
    expect(page).to have_content(2000)
  end
end