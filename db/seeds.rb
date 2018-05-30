Bill.destroy_all
User.destroy_all

provider = User.new(user_type: "provider", email: "provider@gmail.com", password: "azerty", first_name: "My", last_name: "Provider")
client = User.new(user_type: "client", email: "client@gmail.com", password: "azerty", first_name: "My", last_name: "Client")
provider2 = User.new(user_type: "provider", email: "provider2@gmail.com", password: "azerty", first_name: "My", last_name: "Provider2")
user_url = "http://kitt.lewagon.com/placeholder/users/ssaunier"
provider.remote_photo_url = user_url
provider.save
client.remote_photo_url = user_url
client.save
provider2.remote_photo_url = user_url
provider2.save

bill_elec = Bill.new(client: client, category: "Electricité", address: "Paris")
bill_gaz = Bill.new(client: client, category: "Gaz", address: "Marseille")
bill_tel = Bill.new(client: client, category: "Téléphonie", address: "Deauville")
bill_box = Bill.new(client: client, category: "Box Internet", address: "Paris")
bill_url = "https://www.fournisseurs-electricite.com/images/fournisseurs/edf/facture/facture-EDF-page-1.jpg"
bill_elec.remote_photo_url = bill_url
bill_elec.save
bill_gaz.remote_photo_url = bill_url
bill_gaz.save
bill_tel.remote_photo_url = bill_url
bill_tel.save
bill_box.remote_photo_url = bill_url
bill_box.save

a1 = Auction.create(bill: bill_elec)
a2 = Auction.create(bill: bill_gaz)
a3 = Auction.create(bill: bill_tel)
a4 = Auction.create(bill: bill_box)


Bid.create(auction: a1, provider: provider2, status: "pending", payment_status: "pending")
Bid.create(auction: a2, provider: provider, status: "pending", payment_status: "pending")
Bid.create(auction: a3, provider: provider, status: "completed", payment_status: "pending")
Bid.create(auction: a4, provider: provider, status: "completed", payment_status: "completed")
