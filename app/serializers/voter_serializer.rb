class VoterSerializer < ActiveModel::Serializer
  attributes :id, :vote_preference, :street_number, :street_name, :city, :state, :postal_code, :address_string, :geocode, :timestamp
end
