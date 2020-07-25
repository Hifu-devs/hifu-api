module Types
  class QueryType < Types::BaseObject
    field :routeEndTime, String, null: true do
       argument :userEmail, String, required: true
    end
    def routeEndTime(userEmail:)
      user = User.find_by(email: userEmail)
      if !user
        raise GraphQL::ExecutionError,  "No user with email #{userEmail}" 
      end
      endTime = user.route.end_time
      endTime
    end
  end
end
