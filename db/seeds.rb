Post.destroy_all
User.destroy_all

User.create([
  {
    name: "Pablo",
    email: "pablo@pablo.com",
    password: "asdfgh",
    password_confirmation: "asdfgh"
  },
  {
    name: "Pepo",
    email: "pepo@pepo.com",
    password: "hgfdsa",
    password_confirmation: "hgfdsa"
  },
  {
    name: "Guille",
    email: "guille@guille.com",
    password: "guille",
    password_confirmation: "guille"
  }
])

