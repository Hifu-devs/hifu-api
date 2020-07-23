require 'rails_helper'

RSpec.describe Types::MutationType do
  after(:each) do
    User.destroy_all
  end

  describe 'checkin mutation' do
    it 'can checkin' do
      user = build(:user_route_contact)
      create(:waypoint, route: user.route)
      3.times do
        create(:waypoint, route_id: user.route.id, previous_id: user.route.waypoints.last.id)
      end
      
      query = <<~QL
      mutation{
        checkIn(
          userEmail: "#{user.email}"
        ){
          user{
            name
            email
          }
        }
      }
      QL

      expect(User.all.count).to eq(1)
      expect(Route.all.count).to eq(1)
      expect(Waypoint.all.count).to eq(4)


      ql_response = HifuApiSchema.execute(query)
      ql_user = ql_response.to_h["data"]["checkIn"]["user"]
      
      expect(Route.all.count).to eq(0)
      expect(Waypoint.all.count).to eq(0)
      expect(User.all.count).to eq(0)
      expect(ql_user["name"]).to eq(user.name)
      expect(ql_user["email"]).to eq(user.email)
    end
  end

  describe 'hifu mutations' do
    it 'can create user contact route waypoints in one endpoint' do

      expected_user = build(:user_route_contact)
      waypoints = build_list(:waypoint, 3)
      
      query = <<~QL
      mutation{
        createHifu(
          user: {
          name:  "#{expected_user.name}"
          email: "#{expected_user.email}"
          phone: "#{expected_user.phone}"
          address: "#{expected_user.address}"
          age: #{expected_user.age}
          race: "#{expected_user.race}"
          gender: "#{expected_user.gender}"
          satTrackerAddress: "#{expected_user.sat_tracker_address}"
          bloodType: "#{expected_user.blood_type}"
          allergies: "#{expected_user.allergies}"
          medicalConditions: "#{expected_user.medical_conditions}"
          heightCM: #{expected_user.heightCM}
          weightKG: #{expected_user.weightKG}
          contact: {
            name: "#{expected_user.contact.name}"
            email: "#{expected_user.contact.email}"
            phone: "#{expected_user.contact.phone}"
          }
          route: {
            startTime:  "#{expected_user.route.start_time}"
            endTime: "#{expected_user.route.end_time}"
            activity: "#{expected_user.route.activity}"
            partySize: #{expected_user.route.party_size}
            notes: "#{expected_user.route.notes}"
            waypoints: [
              {
                latitude: #{waypoints[0].latitude}
                longitude: #{waypoints[0].longitude}
                eta: "#{waypoints[0].eta}"

              },
              {
                latitude: #{waypoints[1].latitude}
                longitude: #{waypoints[1].longitude}
                eta: "#{waypoints[1].eta}"

              },
              {
                latitude: #{waypoints[2].latitude}
                longitude: #{waypoints[2].longitude}
                eta: "#{waypoints[2].eta}"

              }
            ]
          }
        }
        ){
          user{
            name
          }
        }
      }
      QL
      
      ql_response = HifuApiSchema.execute(query)
      user = User.first
      
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
      
      expect(user.contact.name).to eq(expected_user.contact.name)
      expect(user.contact.email).to eq(expected_user.contact.email)
      expect(user.contact.phone).to eq(expected_user.contact.phone)

      expect(user.route.start_time).to eq(expected_user.route.start_time)
      expect(user.route.end_time).to eq(expected_user.route.end_time)
      expect(user.route.activity).to eq(expected_user.route.activity)
      expect(user.route.party_size).to eq(expected_user.route.party_size)
      expect(user.route.notes).to eq(expected_user.route.notes)
      expect(Waypoint.all.count).to eq(waypoints.count)
      expect(user.route.waypoints.first.latitude).to eq(waypoints[0].latitude)
      expect(user.route.waypoints.first.longitude).to eq(waypoints[0].longitude)
      expect(user.route.waypoints.first.eta).to eq(waypoints[0].eta)
      expect(user.route.waypoints.first.next.latitude).to eq(waypoints[1].latitude)
      expect(user.route.waypoints.first.next.next.latitude).to eq(waypoints[2].latitude)
    end
  end
end
