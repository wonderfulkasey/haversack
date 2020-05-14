caleb = User.create(user: "caleb", email: "caleb@email.com", password: "fire")
jester = User.create(user: "jester", email: "jester@email.com", password: "ruby")

waterskin = Item.create(title: "waterskin", date: "4/4/4",
            character: "caleb", description:"holds water")

notebook = Item.create(title: "notebook", date: "5/5/5",
            character: "jester", description:"sketches inside")
