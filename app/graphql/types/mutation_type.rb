module Types
  class MutationType < Types::BaseObject
    field :create_hifu, mutation: Mutations::CreateHifu
    field :check_in, mutation: Mutations::CheckIn
  end
end
