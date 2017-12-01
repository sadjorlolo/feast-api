[![Feast Logo](https://i.imgur.com/WYoH4Xf.png)](https://sadjorlolo.github.io/feast-client/)

# Feast

[Feast](https://sadjorlolo.github.io/feast-client/) is a full-stack web
application created by me, Sarah Adjorlolo. Both the
[front-end repository](https://github.com/sadjorlolo/feast-client) and the
[back-end repository](https://github.com/sadjorlolo/feast-api) are pinned to my
[personal](https://github.com/sadjorlolo)
GitHub page.

The application can be found here: https://sadjorlolo.github.io/feast-client/.

The back-end is deployed here: https://secure-hamlet-26595.herokuapp.com/.

## About the Application

The purpose of this application is to allow a user to manage their personal
events and the attendees of their events.

When a user signs up, they have the typical authorizaton capabilities to sign
in, change password, and sign out. For this application, the user can also
create custom events, with date, time, location, and description attributes.

Once the event has been successfully created, the event creator has full CRUD
capabilities - they can view, update, and delete the event as they please.
Additionally, the event creator can invite other users to their events. As long
as the invited user exists within Feast and is not already listed as an attendee
for this specific event, they can be added. While an event creator cannot
delete an added attendee from an event, upon event deletion, all invitations to
attendees are subsequently deleted.

If a user has been invited to an event, they are able to see all received
invitations, view a single event to which they have been invited, and reject the
invitation. If a user rejects an invitation, they are removed from the list of
current attendees on the event creator's event.

## Development Process

Development of Feast began with the back-end Rails API set-up. I needed three
tables: Users, Events, and Invitees. Relationships were a bit tricky, as they
were bi-directional many-to-many. A User could have many events as an
event_creator, but a User could also have many events as an event_attendee,
through the Invitee join table. This was accomplished by creating custom names
for the User and for the Event, such as "event_creator", "event_attendee", and
"attended_event." A User has_many attended_events and created_events, and an
Event has_many event_attendees and has_one event_creator. The two tables are
joined together through the Invitees table, which has one event_attendee and
one attended_event.

After creating the tables and the custom relationships between the three, I tested
the relationships with curl scripts. This ensured records could be created,
viewed, updated, and deleted by a user, given specific constraints. For problem
solving, I would use curl scripts to identify where I was receiving errors and
work backward through the routes, permitted parameters, controller actions, etc.
I would add a fix, re-test in the curl scripts, and keep going until the script
worked as anticipated.

The front-end was created using the front-end framework Angular 2; and I used the
Angular authorization template created by Brian Distefano to get started.

I was able to set up each component, generating modules and services as needed
for my Invittes and Events resources. Multiple console.logs were used in the
development process to make sure I was both passing and receiving the
expected data. When I encountered a problem, as I often did, I would comment
out large sections of code step through the data flow process a piece at a time
until I could find the section that was breaking. If I could fix that, I would
repeat the process, slowly adding in commented-out code to test further steps in
the process.

## Technologies Used

- Heroku for app deployment
- Ruby on Rails
- curl scripts for testing in Terminal
- Github pages for deploying the front-end

## Back-end API Endpoints

| Verb   | URI Pattern            | Controller#Action   |
|:-------|:-----------------------|:--------------------|
| POST   | `/sign-up`             | `users#signup`      |
| POST   | `/sign-in`             | `users#signin`      |
| DELETE | `/sign-out/:id`        | `users#signout`     |
| PATCH  | `/change-password/:id` | `users#changepw`    |
| GET    | `/events`              | `events#index`      |
| GET    | `/events/:id`          | `events#show`       |
| POST   | `/events`              | `events#create`     |
| PATCH  | `/events/:id`          | `events#update`     |
| DELETE | `/events/:id`          | `events#destroy`    |
| GET    | `/invitees`            | `invitees#index`    |
| GET    | `/invitees/:id`        | `invitees#show`     |
| POST   | `/invitees`            | `invitees#create`   |
| DELETE | `/invitees/:id`        | `invitees#destroy`  |

## Future Iterations

1) Add functonality to let event creator delete attendees from event.
2) Responsiveness.
3) When users enter attendee name, use fuzzy match to query all users.

## Entity Relationship Diagram

![Feast ERD](https://i.imgur.com/JGCe900.jpg)
