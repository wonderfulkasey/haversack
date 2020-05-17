
liam = User.create(username: "caleb", email: "caleb@email.com", password: "fire"),
laura = User.create(username: "jester", email: "jester@email.com", password: "ruby")


waterskin = Item.create(title: "waterskin", user_id: "1", description: "holds water", character: "caleb"),

notebook = Item.create(title: "notebook", user_id: "2", description: "sketches inside", character: "jester")
