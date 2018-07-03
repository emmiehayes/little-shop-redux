RSpec.describe 'user' do
  context 'visiting /merchants/id' do
    it 'should see a single merchant with all of its items' do
      merchant = Merchant.create(name: "KONG")

      item_1 = merchant.items.create(
                                    title: 'VapeTron',
                                    description: 'World\'s #1 Vape Pen',
                                    price: 500,
                                    image: '/data/image_file_name'
                                    )
      item_2 = merchant.items.create(
                                    title: 'VapeJuice',
                                    description: 'Grape flavor',
                                    price: 100,
                                    image:'/data/image_file_name_'
                                    )

      visit "/merchants/#{merchant.id}"

      expect(page).to have_content(merchant.name)
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.title)
    end

    it 'can click edit button to edit merchant' do
      merchant = Merchant.create(name: "KONG")

      visit "/merchants/#{merchant.id}"
      click_button "Edit"

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
    
    it 'can click delete button to delete merchant' do
      merchant = Merchant.create(name: "KONG")

      visit "/merchants/#{merchant.id}"
      click_button 'Delete'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant.name)
    end
  end
end
