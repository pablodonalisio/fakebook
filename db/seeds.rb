User.destroy_all

User.create([
  {
    email: "pablo@pablo.com",
    password: "asdfgh",
    password_confirmation: "asdfgh"
  },
  {
    email: "pepo@pepo.com",
    password: "hgfdsa",
    password_confirmation: "hgfdsa"
  }
])