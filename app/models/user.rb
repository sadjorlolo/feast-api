# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :created_events, class_name: 'Event', inverse_of: 'event_creator'
  has_many :invitees
  has_many :attended_events, through: :invitees
end
