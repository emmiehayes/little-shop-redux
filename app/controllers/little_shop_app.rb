class LittleShopApp < Sinatra::Base

  get '/merchants/dashboard' do
    @merchants = Merchant.all
    @most_items = Merchant.most_items
    @highest_priced_item = Merchant.highest_priced_item
    erb :'merchants/dashboard'
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do
    Merchant.update(params[:id], params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items/dashboard' do
    @items = Item.all
    @average_unit_price = Item.average_unit_price
    @total_item_count = Item.total_item_count
    @newest = Item.newest
    @oldest = Item.oldest
    erb :'items/dashboard'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do
    Item.update(params[:id], params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.destroy(params[:id])
    redirect '/items'
  end

  get '/invoices/dashboard' do
    @invoices = Invoice.all.includes(:invoice_items)
    @percentage_shipped = Invoice.percentage_by_status('shipped')
    @percentage_pending = Invoice.percentage_by_status('pending')
    @percentage_returned = Invoice.percentage_by_status('returned')
    @lowest_total = Invoice.invoice_with_lowest_total
    @highest_total = Invoice.invoice_with_highest_total
    @lowest_quantity = Invoice.invoice_with_lowest_quantity
    @highest_quantity = Invoice.invoice_with_highest_quantity
    erb :'invoices/dashboard'
  end

  get '/invoices' do
    @invoices = Invoice.all.includes(:invoice_items)
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    @merchant = Merchant.where(id: @invoice.merchant_id)
    erb :'invoices/show'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end

  put '/invoices/:id' do
    Invoice.update(params[:id], params[:invoice])
    redirect "/invoices/#{params[:id]}"
  end

  delete '/invoices/:id' do
    Invoice.destroy(params[:id])
    redirect '/invoices'
  end
end
