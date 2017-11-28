describe Rental do
  let(:days) { [1, 2, 4, 7, 8] }
  let(:bookings) { days.map { |day| double(:booking, date: day) } }
  let(:booking) { double(:booking) }
  let(:booking_class) { double(:booking_class, create: booking) }

  subject { described_class.new(id: 1) }
  before(:each) { allow(subject.bookings).to receive(:<<) }

  describe '#booked_dates' do
    before(:each) do 
      allow(subject).to receive(:bookings).and_return(bookings)
    end

    context 'when getting dates' do
      it 'gets dates from rental object' do
        expect(subject.booked_dates).to eq days
      end
    end
  end

  describe '#available?' do
    before(:each) do 
      allow(subject).to receive(:bookings).and_return(bookings)
    end

    context 'when available' do
      it 'returns true' do
        expect(subject.available?(10..12)).to be true
      end
    end

    context 'when unavailable' do
      it 'returns false for range over booked day' do
        expect(subject.available?(3..5)).to be false
      end

      it 'returns false for single booked day' do
        expect(subject.available?(2..2)).to be false
      end

      it 'returns false for range overlapping with booked period' do
        expect(subject.available?(8..10)).to be false
      end
    end
  end

  describe '#book_day' do
    let(:date) { 'a date' }
    before(:each) { allow(subject).to receive(:save).and_return(nil) }

    context 'when creating booking' do
      after(:each) { subject.book_day(date, booking_class: booking_class) }
      
      it 'passes correct arguments to booking' do
        expect(booking_class).to receive(:create)
          .with({ date: date, rental_id: 1 })
      end

      it 'saves self' do
        expect(subject).to receive(:save)
      end

      it 'adds to bookings' do
        expect(subject.bookings).to receive(:<<).with(booking)
      end
    end
  end

  describe '#book' do
    let(:range) { 5..10 } 

    before(:each) { allow(subject).to receive(:book_day) }
    after(:each) { subject.book(range) }

    it 'books a day for each date in the range' do
      expect(subject).to receive(:book_day).exactly(6).times
    end

    it 'books first day' do
      expect(subject).to receive(:book_day).with(5)
    end

    it 'books last day' do
      expect(subject).to receive(:book_day).with(10)
    end
  end
end
