# Hifu

## When you want to get lost, but still be found

### Overview

A backend Rails application for the Hifu mobile application.

Hifu-api supports it's mobile application counterpart via a Rails + GraphQL api and multiple messaging microservices written in sinatra.  The mobile application can post a hifu route to the api (see endpoints below), which is then stored in a postgresql database. A background worker checks for any routes that have expired (past the `end_time` specified in the `route`). Expired routes are then forwarded to the messaging microservices which contact the emergency contact on record.  
Repositories related to this project include:

- Frontend mobile application [hifu-mobile](https://github.com/Hifu-devs/hifu-mobile)
- Backend Rails applicaiton (currently viewing) [hifu-api](https://github.com/Hifu-devs/hifu-api)
- Email Sinatra microservice [sms_service](https://github.com/Hifu-devs/sms_service)
- SMS Sinatra microservice [email_service](https://github.com/Hifu-devs/email_service)

### Hifu Team

#### Frontend

- [Megan Huggins](https://github.com/MeganHuggins)

#### Backend

- [Margo Flewelling](https://github.com/margoflewelling)
- [Krista Stadler](https://github.com/kristastadler)
- [Brian Greeson](https://github.com/brian-greeson)

### Local Setup

- Clone
- bundle
- rails db:{create,migrate,seed}
- rails s
- All endpoints are available at: `api/v1/`

### Production

- The production version of this API is deployed to [https://hifu-api.herokuapp.com/]( https://hifu-api.herokuapp.com/)


### Endpoints

- #### Mutations
  
  - `createHifu`
    - description
      - Adds an entire hifu record to the app
    - arguments
      - user:
        - name: String
        - email: String
        - phone: Int
        - address: String
        - age: Int
        - race: String
        - gender: String
        - satTrackerAddress: String
        - bloodType: String
        - allergies: String
        - medicalConditions: String
        - heightCM: Int
        - weightKG: Int
        - contact:
          - name: String
          - email: String
          - phone: String
        - route:
          - startTime: String
          - endTime: String
          - activity: String
          - partySize: Int
          - notes: String
          - waypoints: [ ]
            - latitude: Float
            - longitude: Float
            - eta: String
    - return fields
      - user
    - errors
      - TBD
  - `checkIn`
    - description
      - Removes a hifu record from the app
    - arguments
      - userEmail
    - return fields
      - user record that was removed
    - errors
      - TBD
  
- #### Queries
  
  - `routeStartTime`
    - description
      - Return info of single hifu
    - arguments
      - userEmail: String
    - fields
      - user
    - errors
      - "No user with email XXXX"
