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
          )
        }
      QL

      ql_response = HifuApiSchema.execute(query)
      startTime = ql_response.to_h["data"]["routeStartTime"]

      expect(startTime).to eq(user.route.start_time.to_s)
    end

    it 'responds with not found message when user not found' do
      query = <<~QL
        query{
          routeStartTime(
            userEmail: "tacos@tacos.com"
          )
        }
      QL

      ql_response = HifuApiSchema.execute(query)
      startTime = ql_response.to_h["data"]["routeStartTime"]

      expect(ql_response.to_h["errors"].first["message"]).to eq("No user with email tacos@tacos.com")
      expect(startTime).to eq(nil)
    end
  end
end
