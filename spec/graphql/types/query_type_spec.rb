require 'rails_helper'

RSpec.describe 'Types::QueryType' do
  describe 'routeStartTime' do
    it 'responds with a routes start time' do
      build(:user_route_contact).save!
      user = build(:user_route_contact)
      user.save!
      build(:user_route_contact).save!

      query = <<~QL
        query{
          routeStartTime(
            userEmail: "#{user.email}"
          ){
            route{
              startTime
            }
          }
        }
      QL

      ql_response = HifuApiSchema.execute(query)
      ql_route = ql_response.to_h["data"]["routeStartTime"]["route"]

      expect(ql_route.startTime).to eq(user.route.start_time)
    end
  end
end
