puts "Cleaning database..."
Message.destroy_all
Conversation.destroy_all
Bid.destroy_all
Auction.destroy_all
Bill.destroy_all
ProviderCategory.destroy_all
Category.destroy_all
Order.destroy_all
User.destroy_all


puts "Creating providers..."
edf = User.new(user_type: "provider", email: "contact@edf.com", password: "azerty", company: "EDF", address: "Tour Coupole, 2 Pl. Jean Millier, 92078 Paris La Défense", phone_number: "0102030405")
edf.remote_photo_url = "http://tous-logos.com/wp-content/uploads/2017/08/Logo-EDF.png"
edf.save
total = User.new(user_type: "provider", email: "contact@total.com", password: "azerty", company: "EDF", address: "30 Avenue de Wagram, 75008 Paris", phone_number: "0102030405")
total.remote_photo_url = "https://www.anthedesign.fr/w2015/wp-content/uploads/2014/08/total-e1408902379554.png"
total.save

puts "Creating clients..."
ayoub = User.new(user_type: "client", email: "ayoub@gmail.com", password: "azerty", client_type: "particulier", first_name: "Ayoub", last_name: "Karioun", address: "10 rue Miollis 75015", phone_number: "0102030405")
ayoub.save
alex = User.new(user_type: "client", email: "alex@gmail.com", password: "azerty", client_type: "particulier", first_name: "Alexandre", last_name: "Canonica", address: "16 villa Gaudelet 75011", phone_number: "0102030405")
alex.remote_photo_url = "https://media.licdn.com/dms/image/C4D03AQGAQyk6sJvo0w/profile-displayphoto-shrink_200_200/0?e=1529881200&v=beta&t=No8526GSqyoeIWxhs20pg8npD53h-RDaV462ex2wiWc"
alex.save
emna = User.new(user_type: "client", email: "emna@gmail.com", password: "azerty", client_type: "particulier", first_name: "Emna", last_name: "Gellaty", address: "103 avenue des Champs Elysees 75008", phone_number: "0102030405")
emna.save

puts "Creating categories..."
elec = Category.create(name: "Electricité", price_cents: 1500)
gaz = Category.create(name: "Gaz", price_cents: 1500)
tel = Category.create(name: "Téléphonie", price_cents: 1000)
box = Category.create(name: "Box Internet", price_cents: 500)

puts "Creating bills..."
bill_elec_url = "https://www.fournisseurs-electricite.com/images/fournisseurs/edf/facture/facture-EDF-page-1.jpg"
bill_gaz_url = "https://www.daurine.com/wp-content/uploads/2016/11/facture-de-gaz-1.jpg"
bill_alex_elec = Bill.new(client: alex, category: elec, address: "Paris", current_provider: "EDF", price: 120)
bill_alex_elec.remote_photo_url = bill_elec_url
bill_alex_elec.save
bill_alex_elec2 = Bill.new(client: alex, category: elec, address: "Deauville", current_provider: "EDF", price: 60)
bill_alex_elec2.remote_photo_url = bill_elec_url
bill_alex_elec2.save
bill_alex_elec3 = Bill.new(client: alex, category: elec, address: "Nice", current_provider: "Direct Energie", price: 40)
bill_alex_elec3.remote_photo_url = bill_elec_url
bill_alex_elec3.save
bill_alex_gaz = Bill.new(client: alex, category: gaz, address: "Paris", current_provider: "GDF", price: 80)
bill_alex_gaz.remote_photo_url = bill_gaz_url
bill_alex_gaz.save
bill_alex_gaz2 = Bill.new(client: alex, category: gaz, address: "Deauville", current_provider: "Total", price: 60)
bill_alex_gaz2.remote_photo_url = bill_gaz_url
bill_alex_gaz2.save

bill_ayoub_elec = Bill.new(client: ayoub, category: elec, address: "Paris", current_provider: "EDF", price: 120)
bill_ayoub_elec.remote_photo_url = bill_elec_url
bill_ayoub_elec.save
bill_ayoub_elec2 = Bill.new(client: ayoub, category: elec, address: "Deauville", current_provider: "EDF", price: 60)
bill_ayoub_elec2.remote_photo_url = bill_elec_url
bill_ayoub_elec2.save

puts "Creating provider_categories..."
ProviderCategory.create(user:edf, category:elec)
ProviderCategory.create(user:edf, category:gaz)
ProviderCategory.create(user:total, category:elec)
ProviderCategory.create(user:total, category:gaz)

puts "Creating auctions..."
a1 = Auction.create(bill: bill_alex_elec)
a2 = Auction.create(bill: bill_alex_elec2)
a3 = Auction.create(bill: bill_alex_elec3)
a4 = Auction.create(bill: bill_alex_gaz)
a5 = Auction.create(bill: bill_alex_gaz2)
a6 = Auction.create(bill: bill_ayoub_elec)
a7 = Auction.create(bill: bill_ayoub_elec2)

puts "Creating bids..."
Bid.create(auction: a1, provider: edf, status: "pending", payment_status: "pending", content: "Price 110")
Bid.create(auction: a1, provider: total, status: "pending", payment_status: "pending", content: "Price 105")
Bid.create(auction: a1, provider: edf, status: "pending", payment_status: "pending", content: "Price 100")
Bid.create(auction: a1, provider: total, status: "pending", payment_status: "pending", content: "Price 95")

Bid.create(auction: a2, provider: edf, status: "pending", payment_status: "pending", content: "Price 55")

Bid.create(auction: a3, provider: edf, status: "pending", payment_status: "pending", content: "Price 40")
Bid.create(auction: a3, provider: total, status: "pending", payment_status: "pending", content: "Price 37")
Bid.create(auction: a3, provider: edf, status: "completed", payment_status: "pending", content: "Price 35")

Bid.create(auction: a4, provider: total, status: "pending", payment_status: "pending", content: "Price 65")

Bid.create(auction: a5, provider: edf, status: "pending", payment_status: "pending", content: "Price 110")
Bid.create(auction: a5, provider: total, status: "pending", payment_status: "pending", content: "Price 105")
Bid.create(auction: a5, provider: edf, status: "pending", payment_status: "pending", content: "Price 100")
Bid.create(auction: a5, provider: total, status: "completed", payment_status: "completed", content: "Price 95")

Bid.create(auction: a6, provider: total, status: "pending", payment_status: "pending", content: "Price 105")
Bid.create(auction: a6, provider: total, status: "completed", payment_status: "pending", content: "Price 95")

Bid.create(auction: a7, provider: edf, status: "pending", payment_status: "pending", content: "Price 110")
Bid.create(auction: a7, provider: total, status: "pending", payment_status: "pending", content: "Price 105")
Bid.create(auction: a7, provider: edf, status: "completed", payment_status: "completed", content: "Price 100")
Bid.create(auction: a7, provider: total, status: "pending", payment_status: "pending", content: "Price 95")

puts "Creating conversations..."
c1 = Conversation.create(auction: a1, provider: edf)
c1_t = Conversation.create(auction: a1, provider: total)
c2 = Conversation.create(auction: a2, provider: edf)
c3 = Conversation.create(auction: a3, provider: edf)
c3_t = Conversation.create(auction: a3, provider: total)
c4_t = Conversation.create(auction: a4, provider: total)
c5 = Conversation.create(auction: a5, provider: edf)
c5_t = Conversation.create(auction: a5, provider: total)
c6 = Conversation.create(auction: a6, provider: edf)
c6_t = Conversation.create(auction: a6, provider: total)
c7 = Conversation.create(auction: a7, provider: edf)
c7_t = Conversation.create(auction: a7, provider: total)

puts "Creating messages..."
Message.create(conversation: c1, sender: edf, content: "Dear Alex, we are pleased to inform you that can offer you 10 euros reduction on your contract. Please let us know if have any question.")
Message.create(conversation: c1, sender: alex, content: "Hi, thanks for your offer, but Total has a better offer :) Is it the best you can do?")
Message.create(conversation: c1, sender: edf, content: "As you are a loyal customer, we generated a bid at 100 euros! Hope you'll stay with :)")

Message.create(conversation: c2, sender: alex, content: "Hi, could you give me some more details about the bid you made. Will I have exactly the same service that I already have? Thanks")
Message.create(conversation: c2, sender: total, content: "Hi Alex! Sure, we can keep your contract for a lower price :)")

Message.create(conversation: c6_t, sender: total, content: "Dear Ayoub, we are pleased to inform you that can offer you 10 euros reduction on your contract. Please let us know if have any question.")
Message.create(conversation: c6_t, sender: ayoub, content: "Hi, thanks for your offer, but its not enough. I'm waiting for a lower bid. Thanks")

puts "Finished!"
