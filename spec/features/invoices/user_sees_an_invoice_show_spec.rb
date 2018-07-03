RSpec.describe "Invoice Show" do
  context "user visits the invoice show page" do
    it "should see the invoice header" do
      merchant = Merchant.create(name: "Vapin' the Day Away")
      invoice_1 = Invoice.create(merchant_id: merchant.id, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: merchant.id, status: 'shipped')
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

      visit "/invoices/#{invoice_1.id}"

      expect(page).to have_content("Invoice: #{invoice_1.id} - #{invoice_1.status}")
    end

    it "should see the merchant name" do
      merchant = Merchant.create(name: "Vapin' the Day Away")
      invoice = Invoice.create(merchant_id: merchant.id, status: 'shipped')
      item_1 = merchant.items.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                         )

      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(invoice.merchant.name)
    end
  end
end
