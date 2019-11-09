# create test users
jenny = User.create(username: "johara", email: "jenny@test.com", password: "password")
lou = User.create(username: "llou", email: "lou@test.com", password: "password")
pheebs = User.create(username: "pheebs", email: "pheebs@test.com", password: "password")
# create test journal entries
JournalEntry.create(date: "01/11/2019", content:"This is a test post", user_id: jenny.id)
JournalEntry.create(date: "04/11/2019", content:"It's a rainy day in Nottingham", user_id: jenny.id)

lou.journal_entries.create(date: "05/11/2019", content:"Lets see if this works!")
pheebs.journal_entries.create(date: "07/11/2019", content:"Another day, another line of code")

Mood.create(mood_type: "Happy")
Mood.create(mood_type: "Bored")
Mood.create(mood_type: "Angry")
Mood.create(mood_type: "Excited")
Mood.create(mood_type: "Tired")
Mood.create(mood_type: "Frustrated")
Mood.create(mood_type: "Calm")
Mood.create(mood_type: "Sad")
Mood.create(mood_type: "Hurting")
