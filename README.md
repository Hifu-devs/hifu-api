# README

## Hifu

A backend for the Hifu mobile application.

Hifu-api supports it's mobile application counterpart via a Rails + GraphQL api and multiple messaging microservices written in sinatra.  The mobile application can post a hifu route to the api (see endpoints below), which is then stored in a postgresql database. A background worker checks for any routes that have expired (past the `end_time` specified in the `route`). Expired routes are then forwarded to the messaging microservices which contact the emergency contact on record.

### Local Setup
 - Clone
 - bundle
 - rails s
 - you


### Endpoints

- #### Mutations
  - `createHifu`
    - description
      - Creates an entire hifu record in the DB
    - arguments
      - user
        - name
        - email
        - phone
        - address
        - age
        - race
        - gender
        - sat
    - return fields
    - errors
  - `checkIn`
    - description
    - arguments
    - return fields
    - errors
- #### Queries
  - `route`
    - description
    - arguemtns
    - fields
    - errors
  

