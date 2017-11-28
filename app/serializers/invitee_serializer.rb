class InviteeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :event_attendee
  has_one :attended_event
end
