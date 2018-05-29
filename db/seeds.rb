# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

users = User.create(user_type: "provider", email: "provider@gmail.com", password: "azerty", first_name: "Jerome", last_name: "Dubois")
users = User.create(user_type: "client", email: "client@gmail.com", password: "azerty", first_name: "Heba", last_name: "Dubois")
users = User.create(user_type: "client", email: "another_client@gmail.com", password: "azerty", first_name: "Julie", last_name: "Dupont")
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bills = Bill.create(user_id: 2, category: "Gaz", address: "Paris")
bills = Bill.create(user_id: 2, category: "Electricité", address: "Marseille")
bills = Bill.create(user_id: 3, category: "Téléphonie", address: "Deauville")

bills = Bill.create(user_id: 1, category: "Gaz", address: "Deauville")




auctions = Auction.create(bill_id: 2)
auctions = Auction.create(bill_id: 2)
auctions = Auction.create(bill_id: 3)

auctions = Auction.create(bill_id: 4)




bids = Bid.create(auction_id: 1, user_id: 2, status: "completed", payment_status: "pending")
bids = Bid.create(auction_id: 2, user_id: 2, status: "pending", payment_status: "pending")
bids = Bid.create(auction_id: 4, user_id: 1, status: "completed", payment_status: "cancelled")

