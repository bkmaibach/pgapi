class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(username:, email:, password:)
    user = User.new(username: username, email: email, password: password)
    if (user.save)
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      } 
    end
  end
end

# EXAMPLE QUERY:

# mutation {
#   createUser(input:{username: "Qeither", email:"qadmin@keither.net", password:"password"}) {
#     user {
#       id,
#       username,
#       email,
#       articles {
#         title,
#         description
#       }
#     }
#   	errors
#   }
# }
