require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')



merchant1 = Merchant.new({
  "name" => "Tesco"
})

merchant2 = Merchant.new({
  "name" => "Boots"
})

merchant3 = Merchant.new({
  "name" => "Asda"
})

merchant4 = Merchant.new({
  "name" => "Hiscox"
})

merchant5 = Merchant.new({
  "name" => "Amazon"
})

merchant6 = Merchant.new({
  "name" => "Newlands LTC"
})

merchant7 = Merchant.new({
  "name" => "Majestic Wine"
})

merchant8 = Merchant.new({
  "name" => "The Black Bull"
})


merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()
merchant6.save()
merchant7.save()
merchant8.save()

tag1 = Tag.new({
  "title" => "Petrol",
  "budget" => 600
})

tag2 = Tag.new({
  "title" => "Shopping",
  "budget" => 750
})

tag3 = Tag.new({
  "title" => "Insurance",
  "budget" => 150
})

tag4 = Tag.new({
  "title" => "Sports",
  "budget" => 250
})

tag5 = Tag.new({
  "title" => "Going Out",
  "budget" => 300
})

tag6 = Tag.new({
  "title" => "Wine",
  "budget" => 50
})

tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()

transaction1 = Transaction.new({
  "trans_date" => "2018-09-15",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 120.22
})

transaction2 = Transaction.new({
  "trans_date" => "2018-09-25",
  "merchant_id" => merchant3.id,
  "tag_id" => tag1.id,
  "amount" => 100.12
})

transaction3 = Transaction.new({
  "trans_date" => "2018-10-01",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 103.78
})

transaction4 = Transaction.new({
  "trans_date" => "2018-10-02",
  "merchant_id" => merchant4.id,
  "tag_id" => tag3.id,
  "amount" => 125.49
})

transaction5 = Transaction.new({
  "trans_date" => "2018-09-20",
  "merchant_id" => merchant8.id,
  "tag_id" => tag5.id,
  "amount" => 45.65
})

transaction6 = Transaction.new({
  "trans_date" => "2018-09-27",
  "merchant_id" => merchant8.id,
  "tag_id" => tag5.id,
  "amount" => 23.12
})

transaction7 = Transaction.new({
  "trans_date" => "2018-10-03",
  "merchant_id" => merchant8.id,
  "tag_id" => tag5.id,
  "amount" => 78.32
})
transaction8 = Transaction.new({
  "trans_date" => "2018-10-03",
  "merchant_id" => merchant7.id,
  "tag_id" => tag6.id,
  "amount" =>40.99
})

transaction9 = Transaction.new({
  "trans_date" => "2018-09-12",
  "merchant_id" => merchant6.id,
  "tag_id" => tag5.id,
  "amount" =>34.56
})
transaction10 = Transaction.new({
  "trans_date" => "2018-09-18",
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" =>98.32
})

transaction11 = Transaction.new({
  "trans_date" => "2018-09-25",
  "merchant_id" => merchant5.id,
  "tag_id" => tag2.id,
  "amount" =>65.91
})

transaction12 = Transaction.new({
  "trans_date" => "2018-09-30",
  "merchant_id" => merchant1.id,
  "tag_id" => tag2.id,
  "amount" =>39.99
})

transaction13 = Transaction.new({
  "trans_date" => "2018-10-02",
  "merchant_id" => merchant3.id,
  "tag_id" => tag2.id,
  "amount" =>108.67
})

transaction14 = Transaction.new({
  "trans_date" => "2018-10-04",
  "merchant_id" => merchant1.id,
  "tag_id" => tag2.id,
  "amount" =>23.54
})

transaction15 = Transaction.new({
  "trans_date" => "2018-09-24",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" =>41.99
})

transaction16 = Transaction.new({
  "trans_date" => "2018-10-03",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" =>105.43
})

transaction17 = Transaction.new({
  "trans_date" => "2018-10-03",
  "merchant_id" => merchant6.id,
  "tag_id" => tag4.id,
  "amount" =>60.52
})

transaction18 = Transaction.new({
  "trans_date" => "2018-10-03",
  "merchant_id" => merchant3.id,
  "tag_id" => tag2.id,
  "amount" =>198.37
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()
transaction11.save()
transaction12.save()
transaction13.save()
transaction14.save()
transaction15.save()
transaction16.save()
transaction17.save()
transaction18.save()

binding.pry
nil
