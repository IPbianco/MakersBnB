describe 'Booking helpers' do
  let(:booking) { double(:booking, available?: true) }
  let(:booking_class) { double(:booking_class, all: [1, 2]) }

  describe '#rentals_to_json' do
    it 'converts rental object to json' do
      expect(bookings_to_json(booking_class: booking_class)).to eq '[1,2]'
    end
  end
end
