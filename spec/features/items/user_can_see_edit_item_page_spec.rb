RSpec.describe 'User' do
  context 'visiting /items/id/edit' do
    it 'should see item edit form' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )

      visit "/items/#{item.id}/edit"

      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      # expect(page).to have_xpath(item.image)
      expect(page).to have_content(merchant.name)
      expect(page).to have_content(item.price)
    end

    it 'can click cancel button to return to item index' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )

      visit "/items/#{item.id}/edit"

      click_button "Cancel"

      expect(current_path).to eq('/items')
    end

    it 'can click update item button to update in item' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )
      new_title = 'VapeLord'
      visit "/items/#{item.id}/edit"
      fill_in 'item[title]', with: "#{new_title}"
      click_button 'Update Item'

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content("#{new_title}")
    end
  end
end
