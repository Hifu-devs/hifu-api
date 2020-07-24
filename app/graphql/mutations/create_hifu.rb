module Mutations
  class Mutations::CreateHifu < Mutations::BaseMutation
    argument :user, Types::Input::UserInputType, required: true, as: :graph_user

    field :user,  Types::UserType, null: true
    field :errors, [String], null: false

     def resolve(graph_user:)
      user = User.create(
        name: graph_user.name.titleize,
        email: graph_user.email,
        phone: graph_user.phone,
        address: graph_user.address,
        age: graph_user.age,
        race: graph_user.race,
        gender: graph_user.gender.capitalize,
        sat_tracker_address: graph_user.satTrackerAddress,
        blood_type: graph_user.bloodType.upcase,
        allergies: graph_user.allergies,
        medical_conditions: graph_user.medicalConditions.capitalize,
        heightCM: graph_user.heightCM,
        weightKG: graph_user.weightKG,
      )


      contact = graph_user.contact.to_h
      user.contact = Contact.create(
        name: contact[:name].titleize,
        email: contact[:email],
        phone: "+1" + contact[:phone]
      )
      user.route = Route.create(
        start_time: graph_user.route.startTime,
        end_time: graph_user.route.endTime,
        activity: graph_user.route.activity.capitalize,
        party_size: graph_user.route.partySize,
        notes: graph_user.route.notes
      )

      graph_user.route.waypoints.each_with_index do |waypoint, i|
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
