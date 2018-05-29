provider = User.create(user_type: "provider", email: "provider@gmail.com", password: "azerty", first_name: "My", last_name: "Provider")
client = User.create(user_type: "client", email: "client@gmail.com", password: "azerty", first_name: "My", last_name: "Client")
provider2 = User.create(user_type: "provider2", email: "provider2@gmail.com", password: "azerty", first_name: "My", last_name: "Provider2")

Bill.create(user_id: 2, category: "Electricité", address: "Paris")
Bill.create(user_id: 2, category: "Gaz", address: "Marseille")
Bill.create(user_id: 2, category: "Téléphonie", address: "Deauville")
Bill.create(user_id: 2, category: "Box Internet", address: "Paris")

Auction.create(bill_id: 1)
Auction.create(bill_id: 2)
Auction.create(bill_id: 3)
Auction.create(bill_id: 4)


Bid.create(auction_id: 1, user_id: 3, status: "pending", payment_status: "pending")
Bid.create(auction_id: 2, user_id: 1, status: "pending", payment_status: "pending")
Bid.create(auction_id: 3, user_id: 1, status: "completed", payment_status: "pending")
Bid.create(auction_id: 4, user_id: 1, status: "completed", payment_status: "completed")
