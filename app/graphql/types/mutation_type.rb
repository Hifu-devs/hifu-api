module Types
  class MutationType < Types::BaseObject
    field :create_hifu, mutation: Mutations::CreateHifu
    # field :create_user, mutation: Mutations::CreateUser
    # field :create_route, mutation: Mutations::CreateRoute

  end
end
