RSpec.describe 'User' do
  context 'visiting /invoices/dashboard' do
    it 'should see a header' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 5,
                                          unit_price: item_2.price,
                                         )
      visit '/invoices/dashboard'
      expect(page).to have_content('Invoices Dashboard')
    end

    it 'should see percentage of each invoice status' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 5,
                                          unit_price: item_2.price,
                                         )
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'returned')

      visit '/invoices/dashboard'


      expect(page).to have_content("Shipped: #{Invoice.percentage_by_status('shipped')}%")
      expect(page).to have_content("Pending: #{Invoice.percentage_by_status('pending')}%")
      expect(page).to have_content("Returned: #{Invoice.percentage_by_status('returned')}%")
    end

    it 'should see highest and lowest total invoice prices and quantity items' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )

      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 8,
                                          unit_price: item_2.price,
                                         )
      visit '/invoices/dashboard'
      expect(page).to have_content("Highest Invoice Total: #{invoice_2.id}")
      expect(page).to have_content("Lowest Invoice Total: #{invoice_1.id}")
      expect(page).to have_content("Highest Item Quantity: #{invoice_2.id}")
      expect(page).to have_content("Lowest Item Quantity: #{invoice_1.id}")
    end
  end
end
