describe 'Booking helpers' do
  let(:rental) { double(:rental, bookings: [1, 2]) }
  let(:rental_class) { double(:rental_class, first: rental) }
  let(:booking) { double(:booking, available?: true) }
  let(:booking_class) { double(:booking_class, all: [1, 2]) }

  describe '#bookings_to_json' do
    context 'without id number' do
      it 'converts rental object to json' do
        expect(bookings_to_json(booking_class: booking_class)).to eq '[1,2]'
      end
    end
  end

  describe '#rental_bookings_to_json' do
    context 'with id number' do
      after(:each) { rental_bookings_to_json(1, rental_class: rental_class) }

      it 'converts booking objects to json' do
        expect(rental_class).to receive(:first).with({ id: 1 })
      end

      it 'converts booking objects to json' do
        expect(rental_bookings_to_json(1, rental_class: rental_class))
          .to eq '[1,2]'
      end
    end
  end
end
