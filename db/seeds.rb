puts "Cleaning database..."
Bid.destroy_all
Bill.destroy_all
User.destroy_all


puts "Creating users..."
provelecgaz = User.new(user_type: "provider", email: "provelecgaz@gmail.com", password: "azerty", first_name: "My", last_name: "Provider")
client = User.new(user_type: "client", email: "client@gmail.com", password: "azerty", first_name: "My", last_name: "Client")
provelec = User.new(user_type: "provider", email: "provelec@gmail.com", password: "azerty", first_name: "My", last_name: "Provider2")
user_url = "http://kitt.lewagon.com/placeholder/users/ssaunier"
provelecgaz.remote_photo_url = user_url
provelecgaz.save
client.remote_photo_url = user_url
client.save
provelec.remote_photo_url = user_url
provelec.save

puts "Creating categories..."
elec = Category.create(name: "Electricité")
gaz = Category.create(name: "Gaz")
tel = Category.create(name: "Téléphonie")
box = Category.create(name: "Box Internet")

puts "Creating bills..."
bill_elec = Bill.new(client: client, category: elec, address: "Paris")
bill_gaz = Bill.new(client: client, category: gaz, address: "Marseille")
bill_elec2 = Bill.new(client: client, category: elec, address: "Deauville")
bill_elec3 = Bill.new(client: client, category: elec, address: "Paris")
bill_url = "https://www.fournisseurs-electricite.com/images/fournisseurs/edf/facture/facture-EDF-page-1.jpg"
bill_elec.remote_photo_url = bill_url
bill_elec.save
bill_gaz.remote_photo_url = bill_url
bill_gaz.save
bill_elec2.remote_photo_url = bill_url
bill_elec2.save
bill_elec3.remote_photo_url = bill_url
bill_elec3.save

puts "Creating provider_categories..."
ProviderCategory.create(user:provelecgaz, category:elec)
ProviderCategory.create(user:provelecgaz, category:gaz)
ProviderCategory.create(user:provelec, category:elec)

puts "Creating auctions..."
a1 = Auction.create(bill: bill_elec)
a2 = Auction.create(bill: bill_gaz)
a3 = Auction.create(bill: bill_elec2)
a4 = Auction.create(bill: bill_elec3)

puts "Creating bids..."
Bid.create(auction: a1, provider: provelec, status: "pending", payment_status: "pending")
Bid.create(auction: a2, provider: provelecgaz, status: "pending", payment_status: "pending")
Bid.create(auction: a3, provider: provelecgaz, status: "completed", payment_status: "pending")
Bid.create(auction: a4, provider: provelecgaz, status: "completed", payment_status: "completed")

puts "Finished!"