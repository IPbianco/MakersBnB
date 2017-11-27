class MockBooking
  attr_reader :date
  def initialize(date)
    @date = date
  end
end

describe 'Helpers'  do
  let(:date) { Date.new(1991, 7, 25) } 
  let(:bookings) { 10.times.map { |i| MockBooking.new(date + i) } }
  let(:rental) { double(:rental, bookings: bookings) }
  let(:rental_class) do 
    double(:rental_class, all: [1, 2], first: rental)
  end

  describe '#get_rentals' do
    it 'converts rental object to json' do
      expect(get_rentals(rental_class: rental_class)).to eq '[1,2]'
    end
  end

  describe '#check_dates' do
    let(:start) { Date.new(1991, 7, 26) }
    let(:finish) { Date.new(1991, 7, 28) }

    context 'when getting rental object' do
      after(:each) do 
        check_dates(1, start, finish, rental_class: rental_class)
      end

      it 'gets correct rental' do
        expect(rental_class).to receive(:first).with(1)
      end
    end

    context 'when booked over entire period' do
      it 'returns false' do
        expect(check_dates(1, start, finish, rental_class: rental_class))
          .to be false
      end
    end

    context 'when start date overlaps with bookings' do
      let(:start) { date + 9 }
      let(:finish) { date + 14 }

      it 'returns true' do
        expect(check_dates(1, start, finish, rental_class: rental_class))
          .to be true
      end
    end

    context 'when end date overlaps with bookings' do
      let(:start) { date - 10 }
      let(:finish) { date }

      it 'returns true' do
        expect(check_dates(1, start, finish, rental_class: rental_class))
          .to be true
      end
    end

    context 'when not booked at all' do
      let(:start) { Date.new(1991, 7, 13) }
      let(:finish) { Date.new(1991, 7, 24) }

      it 'returns true' do
        expect(check_dates(1, start, finish, rental_class: rental_class))
          .to be true
      end
    end
  end
end
