class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  belongs_to :rental

  validates_uniqueness_of :date, scope: :rental_id
end
