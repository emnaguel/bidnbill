Bill.destroy_all
User.destroy_all

provider = User.create(user_type: "provider", email: "provider@gmail.com", password: "azerty", first_name: "My", last_name: "Provider")
client = User.create(user_type: "client", email: "client@gmail.com", password: "azerty", first_name: "My", last_name: "Client")
provider2 = User.create(user_type: "provider", email: "provider2@gmail.com", password: "azerty", first_name: "My", last_name: "Provider2")

bill_elec = Bill.create(client: client, category: "Electricité", address: "Paris")
bill_gaz = Bill.create(client: client, category: "Gaz", address: "Marseille")
bill_tel = Bill.create(client: client, category: "Téléphonie", address: "Deauville")
bill_box = Bill.create(client: client, category: "Box Internet", address: "Paris")

a1 = Auction.create(bill: bill_elec)
a2 = Auction.create(bill: bill_gaz)
a3 = Auction.create(bill: bill_tel)
a4 = Auction.create(bill: bill_box)


Bid.create(auction: a1, provider: provider2, status: "pending", payment_status: "pending")
Bid.create(auction: a2, provider: provider, status: "pending", payment_status: "pending")
Bid.create(auction: a3, provider: provider, status: "completed", payment_status: "pending")
Bid.create(auction: a4, provider: provider, status: "completed", payment_status: "completed")
