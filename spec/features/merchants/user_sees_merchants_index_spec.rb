RSpec.describe 'user' do
  context 'visiting /merchants' do
    it 'should see a list of all merchants' do
      merchant_1 = Merchant.create(name: "7-eleven")
      merchant_2 = Merchant.create(name: "Rite Aid")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end

    it 'can create a merchant' do
      visit '/merchants'

      click_button "Create A New Merchant"

      expect(current_path).to eq("/merchants/new")
    end

    it 'can click edit button to edit merchant' do
      merchant = Merchant.create(name: "7-eleven")

      visit '/merchants'
      click_button "Edit"

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end

    it 'can click delete button to delete merchant' do
      merchant = Merchant.create(name: 'Darth Vapor')

      visit "/merchants"
      click_button 'Delete'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant.name)
    end
  end
end



