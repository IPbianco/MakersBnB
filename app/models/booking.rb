class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  belongs_to :rental
end
