module Mutations
  class Mutations::CreateHifu < Mutations::BaseMutation
    argument :user, Types::Input::UserInputType, required: true, as: :graph_user
    argument :contact, Types::Input::ContactInputType, required: true, as: :graph_contact
    argument :route, Types::Input::RouteInputType, required: true, as: :graph_route
    argument :waypoints, [Types::Input::WaypointInputType], required: true, as: :graph_waypoints

    field :user,  Types::UserType, null: true
    field :errors, [String], null: false

     def resolve(graph_user:, graph_contact:, graph_route:, graph_waypoints:)
      binding.pry
      user = User.create(
        name: graph_user.name,
        email: graph_user.email,
        phone: graph_user.phone,
        address: graph_user.address,
        age: graph_user.age,
        race: graph_user.race,
        gender: graph_user.gender,
        sat_tracker_address: graph_user.satTrackerAddress,
        blood_type: graph_user.bloodType,
        allergies: graph_user.allergies,
        medical_conditions: graph_user.medicalConditions,
        heightCM: graph_user.heightCM,
        weightKG: graph_user.weightKG,
      )


      contact = graph_contact.to_h

      user.contact = Contact.create(
        name: contact[:name],
        email: contact[:email],
        phone: "+1" + contact[:phone]
      )

      user.route = Route.create(
        start_time: graph_route.startDate,
        end_time: graph_route.endDate,
        activity: graph_route.activity,
        party_size: graph_route.partySize,
        notes: graph_route.notes
      )

      graph_waypoints.each_with_index do |waypoint, i|
        user.route.waypoints << Waypoint.create(
          latitude: waypoint.latitude,
          longitude: waypoint.longitude,
          eta: waypoint.eta
        )
        user.route.waypoints[i-1].next = user.route.waypoints[i] if i > 0
      end
      {user: user}
     end
  end
end
