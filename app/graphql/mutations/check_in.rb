module Mutations
  class Mutations::CheckIn < Mutations::BaseMutation
    argument :userEmail, String, required: true

    field :user, Types::UserType, null: false
    def resolve(userEmail:)
       user = User.find_by(email: userEmail)
       user.destroy
      {user: user}
    end
  end
end
