require 'rails_helper'

RSpec.describe 'Types::QueryType' do
  describe 'routeEndTime' do
    it 'responds with a routes end time' do
      build(:user_route_contact).save!
      user = build(:user_route_contact)
      user.save!
      build(:user_route_contact).save!

      query = <<~QL
        query{
          routeEndTime(
            userEmail: "#{user.email}"
          )
        }
      QL

      ql_response = HifuApiSchema.execute(query)
      endTime = ql_response.to_h["data"]["routeEndTime"]

      expect(endTime).to eq(user.route.end_time.to_s)
    end

    it 'responds with not found message when user not found' do
      query = <<~QL
        query{
          routeEndTime(
            userEmail: "tacos@tacos.com"
          )
        }
      QL

      ql_response = HifuApiSchema.execute(query)
      endTime = ql_response.to_h["data"]["routeEndTime"]

      expect(ql_response.to_h["errors"].first["message"]).to eq("No user with email tacos@tacos.com")
      expect(endTime).to eq(nil)
    end
  end
end
