describe Rental do
  let(:days) { [1, 2, 4, 7, 8] }
  let(:bookings) { days.map { |day| double(:booking, date: day) } }

  subject { described_class.new }
  before(:each) { allow(subject).to receive(:bookings).and_return(bookings) }

  describe '#booked_dates' do
    context 'when getting dates' do
      it 'gets dates from rental object' do
        expect(subject.booked_dates).to eq days
      end
    end
  end

  describe '#available?' do
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
end
