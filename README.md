# Hifu

## When you want to get lost, but still be found

### Overview

A backend for the Hifu mobile application.

Hifu-api supports it's mobile application counterpart via a Rails + GraphQL api and multiple messaging microservices written in sinatra.  The mobile application can post a hifu route to the api (see endpoints below), which is then stored in a postgresql database. A background worker checks for any routes that have expired (past the `end_time` specified in the `route`). Expired routes are then forwarded to the messaging microservices which contact the emergency contact on record.

### Local Setup

 - Clone
 - bundle
 - rails db:{create,migrate,seed}
 - rails s
 - All endpoints are available at: `/graphql`


### Endpoints

- #### Mutations
  
  - `createHifu`
    - description
      - Adds an entire hifu record to the app
    - arguments
      - user
        - name
        - email
        - phone
        - address
        - age
        - race
        - gender
        - satTrackerAddress
        - bloodType
        - allergies
        - medicalConditions
        - heightCM
        - weightKG
        - contact:
          - name
          - email
          - phone
        - route:
          - startTime
          - endTime
          - activity
          - partySize
          - notes
          - waypoints: [ ]
            - latitude
            - longitude
            - eta
    - return fields
      - userType
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
  
  - `hifu`
    - description
      - Return info of single hifu
    - arguments
      - userEmail
    - fields
      - User
    - errors
      - TBD
