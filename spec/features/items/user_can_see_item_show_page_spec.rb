RSpec.describe 'User' do
  context 'visiting /items/id' do
    it 'should see item attributes' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )

      visit "/items/#{item.id}"

      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_xpath("//img[contains(@src, item.image)]")      # expect(page).to have_content(item.image)
      expect(page).to have_content(item.merchant.name)
      expect(page).to have_content(item.price)
    end

    it 'can delete an item' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )

      visit "/items/#{item.id}"
      click_button 'Delete'

      expect(current_path).to eq('/items')
      expect(page).to_not have_content(item.title)
    end

  it 'can edit an item' do
    merchant = Merchant.create(name: 'holla atcha vape')
    item = merchant.items.create(
                                title: 'VapeTron',
                                description: 'World\'s #1 Vape Pen',
                                price: 500,
                                image: '/data/image_file_name',
                                )

      visit "/items/#{item.id}"
      click_button 'Edit'

      expect(current_path).to eq("/items/#{item.id}/edit")
    end
  end
end
