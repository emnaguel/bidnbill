puts "Cleaning database..."
Message.destroy_all
Conversation.destroy_all
Order.destroy_all
Auction.destroy_all
Bid.destroy_all
ProviderCategory.destroy_all
Bill.destroy_all
Category.destroy_all
User.destroy_all


puts "Creating providers..."
edf = User.new(user_type: "provider", email: "contact@edf.com", password: "azerty", company: "EDF", address: "Tour Coupole, 2 Pl. Jean Millier, 92078 Paris La Défense", phone_number: "0102030405")
edf.remote_photo_url = "https://media.glassdoor.com/sqll/1274547/edf-trading-squarelogo-1496816336867.png"
edf.save
total = User.new(user_type: "provider", email: "contact@total.com", password: "azerty", company: "Total", address: "30 Avenue de Wagram, 75008 Paris", phone_number: "0102030405")
total.remote_photo_url = "https://www.anthedesign.fr/w2015/wp-content/uploads/2014/08/total-e1408902379554.png"
total.save
eni = User.new(user_type: "provider", email: "contact@eni.com", password: "azerty", company: "ENI", address: "Tour Coupole, 2 Pl. Jean Millier, 92078 Paris La Défense", phone_number: "0102030405")
eni.remote_photo_url = "http://blog.fr.eni.com/wp-content/uploads/2015/04/Eni-gaz-logo-eni-1.png"
eni.save

puts "Creating clients..."
ayoub = User.new(user_type: "client", email: "ayoub@gmail.com", password: "azerty", client_type: "particulier", first_name: "Ayoub", last_name: "Karioun", address: "10 rue Miollis 75015, Paris", phone_number: "0102030405")
ayoub.save
alex = User.new(user_type: "client", email: "alex@gmail.com", password: "azerty", client_type: "particulier", first_name: "Alexandre", last_name: "Canonica", address: "16 villa Gaudelet 75011, Paris", phone_number: "0102030405")
alex.remote_photo_url = "https://media.licdn.com/dms/image/C4D03AQGAQyk6sJvo0w/profile-displayphoto-shrink_200_200/0?e=1529881200&v=beta&t=No8526GSqyoeIWxhs20pg8npD53h-RDaV462ex2wiWc"
alex.save
emna = User.new(user_type: "client", email: "emna@gmail.com", password: "azerty", client_type: "particulier", first_name: "Emna", last_name: "Gellaty", address: "103 avenue des Champs Elysees 75008, Paris", phone_number: "0102030405")
emna.save

puts "Creating categories..."
elec = Category.create(name: "Electricity", price_cents: 1500)
gaz = Category.create(name: "Gaz", price_cents: 1500)
tel = Category.create(name: "Phone", price_cents: 1000)
box = Category.create(name: "Internet", price_cents: 500)

puts "Creating bills..."
bill_elec_url = "https://www.fournisseurs-electricite.com/images/fournisseurs/edf/facture/facture-EDF-page-1.jpg"
bill_gaz_url = "https://www.daurine.com/wp-content/uploads/2016/11/facture-de-gaz-1.jpg"
bill_alex_elec = Bill.new(client: alex, category: elec, address: "16 villa Gaudelet 75011", city: "Paris", zip_code: "75011", current_provider: "EDF", price: 120, consumption: 112)
bill_alex_elec.remote_photo_url = bill_elec_url
bill_alex_elec.save
bill_alex_elec2 = Bill.new(client: alex, category: elec, address: "20 Rue Robert Fossorier, 14800 Deauville", city: "Deauville", zip_code: "14800", current_provider: "EDF", price: 60, consumption: 62)
bill_alex_elec2.remote_photo_url = bill_elec_url
bill_alex_elec2.save
bill_alex_elec3 = Bill.new(client: alex, category: elec, address: "5 Rue de l'Hôtel de ville, Nice", city: "Nice", zip_code: "06300", current_provider: "Direct Energie", price: 40, consumption: 30)
bill_alex_elec3.remote_photo_url = bill_elec_url
bill_alex_elec3.save
bill_alex_gaz = Bill.new(client: alex, category: gaz, address: "16 villa Gaudelet 75011", city: "Paris", zip_code: "75011", current_provider: "GDF", price: 80, consumption: 115)
bill_alex_gaz.remote_photo_url = bill_gaz_url
bill_alex_gaz.save
bill_alex_gaz2 = Bill.new(client: alex, category: gaz, address: "20 Rue Robert Fossorier, 14800 Deauville", city: "Deauville", zip_code: "14800", current_provider: "Total", price: 60, consumption: 25)
bill_alex_gaz2.remote_photo_url = bill_gaz_url
bill_alex_gaz2.save

bill_ayoub_elec = Bill.new(client: ayoub, category: elec, address: "10 rue Miollis 75015, Paris", city: "Paris", zip_code: "75015", current_provider: "EDF", price: 120, consumption: 145)
bill_ayoub_elec.remote_photo_url = bill_elec_url
bill_ayoub_elec.save
bill_ayoub_elec2 = Bill.new(client: ayoub, category: elec, address: "20 Rue Robert Fossorier, 14800 Deauville", city: "Deauville", zip_code: "14800", current_provider: "EDF", price: 60, consumption: 70)
bill_ayoub_elec2.remote_photo_url = bill_elec_url
bill_ayoub_elec2.save

b1 = Bill.new(client: ayoub, category: elec, address: "Avenue Félix Faure, Nice", city: "Nice", zip_code: "06000", current_provider: "Toal", price: 60, consumption: 70)
b2 = Bill.new(client: ayoub, category: elec, address: "6 Rue des Pays-Bas, 44300 Nantes", city: "Nantes", zip_code: "44300", current_provider: "Toal", price: 60, consumption: 70)
b3 = Bill.new(client: ayoub, category: elec, address: "306 Avenue du Prado, 13008 Marseille", city: "Marseille", zip_code: "13008", current_provider: "Toal", price: 60, consumption: 70)
b5 = Bill.new(client: ayoub, category: gaz, address: "Avenue Charles de Gaulle, Neuilly-sur-Seine", city: "Neuilly-sur-Seine", zip_code: "92200", current_provider: "Toal", price: 60, consumption: 70)
b6 = Bill.new(client: ayoub, category: gaz, address: "27 Rue Alexandre Leleux, 59000 Lille", city: "Lille", zip_code: "59000", current_provider: "Toal", price: 60, consumption: 70)
b8 = Bill.new(client: ayoub, category: gaz, address: "20 Avenue Paul Signac, 83990 Saint-Tropez", city: "Saint-Tropez", zip_code: "83990", current_provider: "Toal", price: 60, consumption: 70)
b9 = Bill.new(client: ayoub, category: gaz, address: "67 Avenue Maréchal de Saxe, 69003 Lyon", city: "Lyon", zip_code: "69003", current_provider: "Toal", price: 60, consumption: 70)

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

a11 = Auction.create(bill: b1)
a12 = Auction.create(bill: b2)
a13 = Auction.create(bill: b3)
a15 = Auction.create(bill: b5)
a16 = Auction.create(bill: b6)
a18 = Auction.create(bill: b8)
a19 = Auction.create(bill: b9)

puts "Creating bids..."
Bid.create(auction: a1, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 110)
Bid.create(auction: a1, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 105)
Bid.create(auction: a1, provider: edf, status: "pending", payment_status: "pending", content: "We guarantee that more than 20 per cent of the energy os green. Save our planet while you are saving money!", price: 100)
Bid.create(auction: a1, provider: total, status: "pending", payment_status: "pending", content: "This is the very best offer we can give you. Hope to hear soon from you!", price: 95)

Bid.create(auction: a2, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 55)

Bid.create(auction: a3, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 40)
Bid.create(auction: a3, provider: total, status: "pending", payment_status: "pending", content: "We guarantee that more than 20 per cent of the energy os green. Save our planet while you are saving money!", price: 37)
Bid.create(auction: a3, provider: edf, status: "completed", payment_status: "pending", content: "This is the very best offer we can give you. Hope to hear soon from you!", price: 35)

Bid.create(auction: a4, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)

Bid.create(auction: a5, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 60)
Bid.create(auction: a5, provider: total, status: "pending", payment_status: "pending", content: "We guarantee that more than 20 per cent of the energy os green. Save our planet while you are saving money!", price: 55)
Bid.create(auction: a5, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 55)
Bid.create(auction: a5, provider: total, status: "completed", payment_status: "completed", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 52)

Bid.create(auction: a6, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 115)
Bid.create(auction: a6, provider: total, status: "completed", payment_status: "pending", content: "We guarantee that more than 20 per cent of the energy os green. Save our planet while you are saving money!", price: 115)

Bid.create(auction: a7, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 60)
Bid.create(auction: a7, provider: total, status: "pending", payment_status: "pending", content: "We guarantee that more than 20 per cent of the energy os green. Save our planet while you are saving money!", price: 55)
Bid.create(auction: a7, provider: edf, status: "completed", payment_status: "completed", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 55)
Bid.create(auction: a7, provider: total, status: "pending", payment_status: "pending", content: "This is the very best offer we can give you. Hope to hear soon from you!", price: 50)

Bid.create(auction: a11, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a12, provider: eni, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a13, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)

Bid.create(auction: a15, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a15, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a16, provider: eni, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a16, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a18, provider: eni, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a18, provider: edf, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)

Bid.create(auction: a19, provider: total, status: "pending", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)
Bid.create(auction: a19, provider: edf, status: "completed", payment_status: "pending", content: "We can keep your contract exactly as it currently is for a better price. Don't hesitate to send us a message if you have any question!", price: 75)

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

Message.create(conversation: c1_t, sender: total, content: "Dear Alex, we are pleased to inform you that can offer you 10 euros reduction on your contract. Please let us know if have any question.")
Message.create(conversation: c1_t, sender: alex, content: "Hi, thanks for your offer, but EDF has a better service")
Message.create(conversation: c1_t, sender: total, content: "As you are a loyal customer, we generated a bid at 100 euros! Hope you'll stay with :)")


Message.create(conversation: c2, sender: alex, content: "Hi, could you give me some more details about the bid you made. Will I have exactly the same service that I already have? Thanks")
Message.create(conversation: c2, sender: edf, content: "Hi Alex! Sure, we can keep your contract for a lower price :)")

Message.create(conversation: c6, sender: edf, content: "Dear Ayoub, we are pleased to inform you that can offer you 10 euros reduction on your contract. Please let us know if have any question.")
Message.create(conversation: c6, sender: ayoub, content: "Hi, thanks for your offer, but its not enough. I'm waiting for a lower bid. Thanks")

Message.create(conversation: c6_t, sender: total, content: "Dear Ayoub, we are pleased to inform you that can offer you 10 euros reduction on your contract. Please let us know if have any question.")
Message.create(conversation: c6_t, sender: ayoub, content: "Hi, thanks for your offer, but its not enough. I'm waiting for a lower bid. Thanks")

puts "Finished!"
