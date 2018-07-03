RSpec.describe "User" do
  context "visits merchants/dashboard" do
    it "should see Header" do
      merchant_1 = Merchant.create(name: "Dogs4Life")
      merchant_2 = Merchant.create(name: "Cats, wow")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 700,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_2 = Item.create(
                          title: 'cat bed',
                          description: 'a bed for cats',
                          price: 500,
                          image: 'image url',
                          merchant_id: merchant_2.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 20,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )

        visit '/merchants/dashboard'

        expect(page).to have_content("Merchants Dashboard")
      end

    it "should see Merchant With Most Items" do
      merchant_1 = Merchant.create(name: "Dogs4Life")
      merchant_2 = Merchant.create(name: "Cats, wow")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 700,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_2 = Item.create(
                          title: 'cat bed',
                          description: 'a bed for cats',
                          price: 500,
                          image: 'image url',
                          merchant_id: merchant_2.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 20,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )

      visit '/merchants/dashboard'

      expect(page).to have_content("Merchant With Most Items: #{Merchant.most_items.name}")
      expect(page).to have_content("Merchant With Highest Price Item: #{Merchant.highest_priced_item.name}")
    end

    it "should see Merchant With Most Items" do
      merchant_1 = Merchant.create(name: "Dogs4Life")
      merchant_2 = Merchant.create(name: "Cats, wow")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 700,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_2 = Item.create(
                          title: 'cat bed',
                          description: 'a bed for cats',
                          price: 500,
                          image: 'image url',
                          merchant_id: merchant_2.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 20,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )

      visit '/merchants/dashboard'

      expect(page).to have_content("Item Count: #{merchant_1.total_merchant_items}")
      expect(page).to have_content("Avg Item Price: $ #{merchant_1.average_item_price}")
      expect(page).to have_content("Total Cost of Items: $ #{merchant_1.total_price_all_items}")
      expect(page).to have_content("Item Count: #{merchant_2.total_merchant_items}")
      expect(page).to have_content("Avg Item Price: $ #{merchant_2.average_item_price}")
      expect(page).to have_content("Total Cost of Items: $ #{merchant_2.total_price_all_items}")
    end


  end
end
