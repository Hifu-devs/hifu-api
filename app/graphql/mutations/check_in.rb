module Mutations
  class Mutations::CheckIn < Mutations::BaseMutation
    argument :userEmail, String, required: true

  end
end
