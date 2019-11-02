# create test users
jenny = User.create(username: "johara", email: "jenny@test.com", password: "password")
lou = User.create(username: "llou", email: "lou@test.com", password: "password")

# create test journal entries
JournalEntry.create(content:"This is a test post", user_id: jenny.id)
JournalEntry.create(content:"It's a rainy day in Nottingham", user_id: jenny.id)

lou.journal_entries.create(content:"Lets see if this works!")