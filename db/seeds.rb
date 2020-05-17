users = [
(username: "caleb", email: "caleb@email.com", password: "fire"),
(username: "jester", email: "jester@email.com", password: "ruby")
]

users.each do |user|
  User.create(user)
end

items = [
  (title: "waterskin", description:"holds
            water", character: "caleb"),

  (title: "notebook",
          description:"sketches inside",
          character: "jester")
    ]

    items.each do |item|
      Item.create(item)
    end
