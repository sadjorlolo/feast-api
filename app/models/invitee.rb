class Invitee < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User', foreign_key: 'user_id' #, inverse_of: 'attended_events'

  belongs_to :attended_event, class_name: 'Event', foreign_key: 'event_id' #, inverse_of: 'event_attendees'
end
