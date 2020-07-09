User.destroy_all
Gym.destroy_all
Membership.destroy_all

user1 = User.create(user:"Joey")
user2 = User.create(user:"Rachel Green")
user3 = User.create(user:"Ross")
user4 = User.create(user:"Chandler")
user5 = User.create(user:"Pheobe")
user6 = User.create(user:"Monica")

gym1 = Gym.create(gym: "Brooklyn Boxing #938", location: "Brooklyn")
gym2 = Gym.create(gym: "Blink Fitness #392", location: "Queens")
gym3 = Gym.create(gym: "Xtreme Fitness #295", location: "Staten Island")
gym4 = Gym.create(gym: "Crunch #495", location: "Bronx")
gym5 = Gym.create(gym: "Equinox #947", location: "Manhattan")
gym6 = Gym.create(gym: "Planet Fitness #809", location: "Brooklyn")

#Memberships should be created with status as "Active"
ms1 = Membership.create(user: user1, gym: gym1, status: "Active")
ms2 = Membership.create(user: user2, gym: gym2, status: "Active")
ms3 = Membership.create(user: user3, gym: gym3, status: "Active")
ms4 = Membership.create(user: user4, gym: gym4, status: "Active")
ms5 = Membership.create(user: user5, gym: gym5, status: "Active")
ms6 = Membership.create(user: user6, gym: gym6, status: "Active")
ms7 = Membership.create(user: user1, gym: gym6, status: "Active")
ms8 = Membership.create(user: user2, gym: gym5, status: "Active")
ms9 = Membership.create(user: user3, gym: gym4, status: "Active")
ms10 = Membership.create(user: user4, gym: gym3, status: "Active")
m11 = Membership.create(user: user5, gym: gym2, status: "Active")
ms12 = Membership.create(user: user6, gym: gym1, status: "Active")