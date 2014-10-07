Level.create!([
  {description: "NISKI", value: 23},
  {description: "WYSOKI", value: 54}
])
Question.create!([
  {description: "pytanie1", strength: 1, cancelled: false},
  {description: "pytanie2", strength: 2, cancelled: false}
])
User.create!([
  {name: "admin", email: "admin@wp.pl", password_digest: "$2a$10$AJ9DVtEaPlJkH/.TFQ22nuidRSUXZhEnbK8hd7xMf60EUU8unHaj.", remember_token: "45fbd261e645f3f373c482b2dec79d9a567b50b4", admin: true, forename: "admin", login: "ADM"},
  {name: "Murawski", email: "darek@wp.pl", password_digest: "$2a$10$I1ujFoIFViRuny6S73HElu/heSu/dbIAwMrfCU59S2dE.fTei9Rz.", remember_token: "6a554c1f8592c729d3548fcfcfb20cbc1d4d5052", admin: true, forename: "Dariusz", login: "DMU"},
  {name: "nie-admin1", email: "nie-admin1@wp.pl", password_digest: "$2a$10$7jDY06LG7YdQj.aFor0sF.tWpRfP84czxd6m2AIKClfHhKieCb4Fe", remember_token: "ef0e8a19400329e3542b27b284a3696d50768fe7", admin: false, forename: "nie-admin1", login: "NAD1"},
  {name: "nie-admin2", email: "nie-admin2@wp.pl", password_digest: "$2a$10$lBPM/3oOQgDFahtjON9sNuk0jbAYh/2izRNcb4vW2eMvx28iEdHCa", remember_token: "d0b4ad603f86b11d87555fd64ddd33829ac9e358", admin: false, forename: "nie-admin2", login: "NAD2"}
])
