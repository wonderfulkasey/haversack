caleb = User.create(username: "caleb", email: "caleb@email.com", password: "fire")
jester = User.create(username: "jester", email: "jester@email.com", password: "ruby")

waterskin = Item.create(title: "waterskin", description:"holds
            water", date: "4/4/4", character: "caleb")

notebook = Item.create(title: "notebook",
          description:"sketches inside", date: "5/5/5",
          character: "jester")
