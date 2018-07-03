RSpec.describe 'User' do
  context 'visiting /items/dashboard' do
    it 'should see item dashboard header' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )
      visit '/items/dashboard'

      expect(page).to have_content('Items Dashboard')
    end

    it 'should see item total count' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )

      visit '/items/dashboard'

      expect(page).to have_content("Total Item Count: #{Item.total_item_count}")
    end

    it 'should see average price per item' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )

      visit '/items/dashboard'

      expect(page).to have_content("Avg Price Per Item: $ #{Item.average_unit_price}")
    end

    it 'should see item by age' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )

      visit '/items/dashboard'

      expect(page).to have_content("Item By Age:")
      expect(page).to have_content("#{Item.newest.title}")
      expect(page).to have_content("#{Item.oldest.title}")
    end
  end
end
