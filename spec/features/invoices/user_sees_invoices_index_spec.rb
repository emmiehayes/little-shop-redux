RSpec.describe 'user' do
  context 'visting /invoices' do
    it 'should see a list of all invoice ids' do
      invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

      visit '/invoices'

      expect(page).to have_content(invoice_1.id)
      expect(page).to have_content(invoice_2.id)
      expect(page).to_not have_content(invoice_1.status)
      expect(page).to_not have_content(invoice_2.status)
    end
  
    it 'from /invoices can click edit and be sent to /invoices/id/edit' do
      invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

      visit '/invoices'

      within("#invoice_1") do
        click_button 'Edit'

        expect(current_path).to eq("/invoices/#{invoice_1.id}/edit")
      end
    end

    it 'can delete an invoice and be redirected to /invoices' do
      invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

      visit "/invoices"

        within("#invoice_1") do
          click_button "Delete"

          expect(current_path).to eq("/invoices")
        end

      expect(current_path).to eq('/invoices')
      expect(page).to_not have_content(invoice_1.id)
    end
  end
end