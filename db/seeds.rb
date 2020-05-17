
liam = User.create(username: "caleb", email: "caleb@email.com", password: "fire"),
laura = User.create(username: "jester", email: "jester@email.com", password: "ruby")


waterskin = Item.create(title: "waterskin", user: "caleb", description: "holds water", character: "caleb"),

notebook = Item.create(title: "notebook", user: "jester", description: "sketches inside", character: "jester")
