module Types
  class QueryType < Types::BaseObject
    field :routeStartTime, String, null: true do
       argument :userEmail, String, required: true
    end
    def routeStartTime(userEmail:)
      user = User.find_by(email: userEmail)
      if !user
        raise GraphQL::ExecutionError,  "No user with email #{userEmail}" 
      end
      startTime = user.route.start_time
      startTime
    end
  end
end
