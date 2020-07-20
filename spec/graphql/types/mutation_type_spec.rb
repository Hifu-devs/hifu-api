require 'rails_helper'

RSpec.describe Types::MutationType do
  after(:each) do
    User.destroy_all
  end

  describe 'route mutations' do
    it 'can create user contact route waypoints in one endpoint' do

      expected_user = build(:user_route_contact)
      waypoints = build_list(:waypoint, 3)
      
      query = <<~QL
      mutation{
        create(
          name:  #{expected_user.name}
          email: #{expected_user.email}
          phone: #{expected_user.phone}
          address: #{expected_user.address}
          age: #{expected_user.age}
          race: #{expected_user.race}
          gender: #{expected_user.gender}
          sat_tracker_address: #{expected_user.sat_tracker_address}
          blood_type: #{expected_user.blood_type}
          allergies: #{expected_user.allergies}
          medical_conditions: #{expected_user.medical_conditions}
          heightCM: #{expected_user.heightCM}
          weightKG: #{expected_user.weightKG}
          contact: {
            name: #{expected_user.contact.name}
            email: #{expected_user.contact.email}
            phone: #{expected_user.contact.phone}
          }
          route: {
            start_time:  #{expected_user.route.start_time}
            end_time: #{expected_user.route.end_time}
            activity: #{expected_user.route.activity}
            party_size: #{expected_user.route.party_size}
            notes: #{expected_user.route.notes}
            waypoints: [
              {
                latitude: #{waypoints[0].latitude}
                longitude #{waypoints[0].longitude}
              },
              {
                latitude: #{waypoints[1].latitude}
                longitude #{waypoints[1].longitude}
              },
              {
                latitude: #{waypoints[2].latitude}
                longitude #{waypoints[2].longitude}
              }
            ]
          }
        )
      }
      QL
      
      ql_response = HifuApiSchema.execute(query)
      user = User.first

      if user
        waypoints.each_with_index do |wp, i|
          user.route.waypoints << wp
          user.route.waypoints[i -1].next = user.route.waypoints.last if i > 0
        end
      end

      expect(user.name).to eq(expected_user.name)
      expect(user.email).to eq(expected_user.email)
      expect(user.phone).to eq(expected_user.phone)
      expect(user.address).to eq(expected_user.address)
      expect(user.age).to eq(expected_user.age)
      expect(user.race).to eq(expected_user.race)
      expect(user.gender).to eq(expected_user.gender)
      expect(user.sat_tracker_address).to eq(expected_user.sat_tracker_address)
      expect(user.blood_type).to eq(expected_user.blood_type)
      expect(user.allergies).to eq(expected_user.allergies)
      expect(user.medical_conditions).to eq(expected_user.medical_conditions)
      expect(user.heightCM).to eq(expected_user.heightCM)
      expect(user.weightKG).to eq(expected_user.weightKG)
      
      expect(user.contact.name).to eq(expected_user.weightKG)
      expect(user.contact.email).to eq(expected_user.email)
      expect(user.contact.phone).to eq(expected_user.phone)

      expect(user.route.start_time).to eq(expected_user.route.start_time)
      expect(user.route.end_time).to eq(expected_user.route.end_time)
      expect(user.route.activity).to eq(expected_user.route.activity)
      expect(user.route.party_size).to eq(expected_user.route.party_size)
      expect(user.route.notes).to eq(expected_user.route.notes)

      expect(Waypoint.all.count).to eq(waypoints.count)
      expect(user.route.waypoints.first.latitude).to eq(waypoints[0].latitude)
      expect(user.route.waypoints.first.next.latitude).to eq(waypoints[1].latitude)
      expect(user.route.waypoints.first.next.next.latitude).to eq(waypoints[2].latitude)
    end
  end
end







    # ---------
#     it 'can create a route' do
#     expected_route = build(:route)
#     binding.pry
#     query = <<~QL
#     mutation{
#       createRoute(
#         start_time:  #{expected_route.start_time}
#         end_time: #{expected_route.end_time}
#         activity: #{expected_route.activity}
#         party_size: #{expected_route.party_size}
#         notes: #{expected_route.notes}
#       )
#     }
#     QL
    
#     response = HifuApiSchema.execute(query)
#     response_data = response["data"]
#     route = User.first
#     expect(route.start_time).to eq(expected_route.start_time)
#     expect(route.end_time).to eq(expected_route.end_time)
#     expect(route.activity).to eq(expected_route.activity)
#     expect(route.party_size).to eq(expected_route.party_size)
#     expect(route.notes).to eq(expected_route.notes)
#     end
#   end
  
  
#   describe 'user mutations' do
#     it 'can create a user' do
#     expected_user = build(:user)
    
#     query = <<~QL
#     mutation{
#       createUser(
#         name:  #{expected_user.name}
#         email: #{expected_user.email}
#         phone: #{expected_user.phone}
#         address: #{expected_user.address}
#         age: #{expected_user.age}
#         race: #{expected_user.race}
#         gender: #{expected_user.gender}
#         sat_tracker_address: #{expected_user.sat_tracker_address}
#         blood_type: #{expected_user.blood_type}
#         allergies: #{expected_user.allergies}
#         medical_conditions: #{expected_user.medical_conditions}
#         heightCM: #{expected_user.heightCM}
#         weightKG: #{expected_user.weightKG}
#       )
#     }
#     QL
    
#     response = HifuApiSchema.execute(query)
#     response_data = response["data"]
#     user = User.first
#     binding.pry
#     expect(user.name).to eq(expected_user.name)
#     expect(user.email).to eq(expected_user.email)
#     expect(user.phone).to eq(expected_user.phone)
#     expect(user.address).to eq(expected_user.address)
#     expect(user.age).to eq(expected_user.age)
#     expect(user.race).to eq(expected_user.race)
#     expect(user.gender).to eq(expected_user.gender)
#     expect(user.sat_tracker_address).to eq(expected_user.sat_tracker_address)
#     expect(user.blood_type).to eq(expected_user.blood_type)
#     expect(user.allergies).to eq(expected_user.allergies)
#     expect(user.medical_conditions).to eq(expected_user.medical_conditions)
#     expect(user.heightCM).to eq(expected_user.heightCM)
#     expect(user.weightKG).to eq(expected_user.weightKG)
#     end
#   end

# end



      # createRoute(
      #   start_time: #{u.route.start_time}
      #   end_time: #{u.route.end_time}
      #   activity: #{u.route.activity}
      #   party_size: #{u.route.party_size}
      #   notes: #{u.route.notes}
      # )
      # createWaypoints(
      #   [{
      #     latitude: #{waypoints[0].latitude}
      #     longitude: #{waypoints[0].longitude}
      #   }]
      # )