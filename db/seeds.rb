# Delete old seed data before re-seed
Need.destroy_all
Organization.destroy_all

# Admin.create(
#   email: "testing@test.com",
#   password: "test",
#   first_name: "mike",
#   last_name: "lamb"
# )

sarnelli = Organization.create(
    name: "Blessed Sarnelli Community",
    description: "Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.",
    address: "2739 Kensington Ave, Philadelphia, PA 19134",
    long: -75.123686,
    lat: 39.990711
  )


  sarnelli_needs_list =  [
    ["White socks", "Clothing"],
    ["Mens underwear", "Clothing"],
    ["T-shirts", "Clothing"],
    ["Bars of soap", "Toiletries"],
    ["Pants", "Clothing"],
    ["Long underwear", "Clothing"],
    ["Shoes", "Clothing"],
    ["Sweaters", "Clothing"],
    ["Jackets", "Clothing"],
    ["Shaving cream", "Toiletries"],
    ["Razors", "Toiletries"],
    ["Shampoo", "Toiletries"],
    ["Conditioner", "Toiletries"],
    ["Body wash", "Toiletries"],
    ["Toothbrushes", "Toiletries"],
    ["Toothpaste", "Toiletries"],
    ["Lotion", "Toiletries"],
    ["Hair brushes", "Toiletries"],
    ["Nail clippers", "Toiletries"],
    ["Tomato sauce", "Food Pantry Items"],
    ["Tomato paste", "Food Pantry Items"],
    ["Crushed tomatoes", "Food Pantry Items"],
    ["Ketchup", "Food Pantry Items"],
    ["Black beans", "Food Pantry Items"],
    ["Kidney beans", "Food Pantry Items"],
    ["Pink beans", "Food Pantry Items"],
    ["Rice", "Food Pantry Items"],
    ["Pasta", "Food Pantry Items"],
    ["Coffee", "Food Pantry Items"],
    ["Cake mixes", "Food Pantry Items"],
    ["Canned fruits", "Food Pantry Items"],
    ["Canned vegetables", "Food Pantry Items"],
    ["Tuna", "Food Pantry Items"],
    ["Peanut butter", "Food Pantry Items"],
    ["Jelly", "Food Pantry Items"]
  ]

  sarnelli_needs_list.each do | item, category |
    Need.create(
      organization_id: sarnelli.id, 
      item: item,
      category: category
      )
  end
  
  last_stop = Organization.create(
    name: "Last Stop",
    description: "Last Stop is a no-frills sober living environment where homeless alcoholics and addicts can recover by learning to live a life of service from the example of others like them who are doing the same.  We serve the community every day by handing out clothing and meals to those who are still suffering in the heart of Kensington's drug trade",
    address: "1816 East Somerset St, Philadelphia, PA 19134",
    long: -75.122393,
    lat: 39.991042
  )
  
  ls_needs_list = [
    ["Shoes", "Clothing"],
    ["Socks", "Clothing"],
    ["T-shirts", "Clothing"],
    ["Underwear", "Clothing"],
    ["Bras", "Clothing"],
    ["Jeans", "Clothing"],
    ["Tanktops", "Clothing"],
    ["Shorts", "Clothing"],
    ["Hot dogs", "Food"],
    ["Baked beans", "Food"],
    ["Spaghetti", "Food"],
    ["Tomato Sauce", "Food"],
    ["Napkins", "Supplies"],
    ["Paper towels", "Supplies"],
    ["Large styrofoam cups", "Supplies"],
    ["Iced tea mix", "Food"],
    ["Coffee", "Food"],
    ["Styrofoam/paper plates" "Supplies"]
  ]
  
  ls_needs_list.each do | item, category |
    Need.create(
      organization_id: last_stop.id, 
      item: item,
      category: category
      )
  end
  
  rock = Organization.create(
    name: "Rock Ministries",
    description: "A Bible, boxing gloves and five boys … that’s how Rock Ministries started. With its goal to reach at-risk, inner city youth with the Gospel of Jesus Christ, the Rock has now grown to serve over 5000 kids through sports, arts, music, recreation, mentoring and Bible studies.  Through our church, Calvary Chapel of Kensington, we also serve the community with outreaches, support for addicts and others in need, a food pantry, and most importantly the consistent teaching of the Word of God.",
    address: "2755 Kensington Ave, Philadelphia, PA 19134",
    long: -75.123262,
    lat: 39.990834
  )
  
  rock_needs_list = [
    ["Shoes", "Adults' Clothing"],
    ["Socks", "Adults' Clothing"],
    ["T-shirts", "Adults' Clothing"],
    ["Underwear",  "Adults' Clothing"],
    ["Bras", "Adults' Clothing"],
    ["Jeans", "Adults' Clothing"],
    ["Tanktops", "Adults' Clothing"],
    ["Shorts", "Adults' Clothing"],
    ["Shoes", "Childrens' Clothing"],
    ["Socks", "Childrens' Clothing"],
    ["T-shirts", "Childrens' Clothing"],
    ["Underwear", "Childrens' Clothing"],
    ["Pants", "Childrens' Clothing"],
    ["Shorts", "Childrens' Clothing"],
    ["Non-perishable foods", "Food Pantry Items"]
  ]
  
  rock_needs_list.each do | item, category |
    Need.create(
      organization_id: rock.id, 
      item: item,
      category: category
      )
  end

  # User.create(
  #   email: "test@test.com", 
  #   password: "test", 
  #   first_name: "test", 
  #   last_name: "test", 
  #   organization_id: sarnelli.id, 
  #   approved: true)