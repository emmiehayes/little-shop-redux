RSpec.describe 'User' do
  context 'visiting /merchants/new' do
    it 'should be able to create a new merchant' do
      merchant = Merchant.new(name: '7-11')

      visit '/merchants/new'
      fill_in 'merchant[name]', with: "#{merchant.name}"
      click_on 'Create Merchant'
      
      expect(current_path).to eq('/merchants')
      expect(page).to have_content(merchant.name)
    end
  end
end