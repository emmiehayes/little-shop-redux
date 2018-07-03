RSpec.describe 'User' do
  context 'visiting /items/index' do
    it 'should see all items' do
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          merchant_id: 1234567,
                          image: '/data/image_file_name'
                        )
      item_2 = Item.create(
                          title: 'VapeJuice',
                          description: 'Grape flavor',
                          price: 100,
                          merchant_id: 1234567,
                          image:'/data/image_file_name_'
                        )

      visit '/items'

      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_1.price)

      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_2.price)
    end

    it 'can click item title to go to /items/id page' do
      merchant = Merchant.create(name: 'holla atcha vape')
      item = merchant.items.create(
                                  title: 'VapeTron',
                                  description: 'World\'s #1 Vape Pen',
                                  price: 500,
                                  image: '/data/image_file_name',
                                  )
      visit '/items'
      click_link "#{item.title}"

      expect(current_path).to eq("/items/#{item.id}")
    end

    it 'can click create and go to a new item page' do
      visit '/items'

      click_button "Create A New Item"
      expect(current_path).to eq("/items/new")
    end
  end
end
