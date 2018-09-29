require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

Transaction.delete_all
Merchant.delete_all()
Tag.delete_all()


merchant1 = Merchant.new({
  "name" => "Tesco",
})

merchant2 = Merchant.new({
  "name" => "Asda",
})

merchant1.save()
merchant2.save()

tag1 = Tag.new({
  "title" => "petrol",
  "budget" => 200
})

tag2 = Tag.new({
  "title" => "food",
  "budget" => 500
})

tag1.save()
tag2.save()

transaction1 = Transaction.new({
  "trans_date" => "2018-09-28",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 120
})

transaction2 = Transaction.new({
  "trans_date" => "2018-09-28",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" => 80
})

transaction3 = Transaction.new({
  "trans_date" => "2018-09-27",
  "merchant_id" => merchant1.id,
  "tag_id" => tag2.id,
  "amount" => 50
})

transaction4 = Transaction.new({
  "trans_date" => "2018-09-27",
  "merchant_id" => merchant2.id,
  "tag_id" => tag1.id,
  "amount" => 100
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()

binding.pry
nil
