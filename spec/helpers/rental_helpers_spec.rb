describe 'Helpers'  do
  let(:rental) { double(:rental, available?: true) }
  let(:rental_class) { double(:rental_class, all: [1, 2], first: rental) }

  describe '#rentals_to_json' do
    it 'converts rental object to json' do
      expect(rentals_to_json(rental_class: rental_class)).to eq '[1,2]'
    end
  end

  describe '#check_dates' do
    context 'when getting rental object' do
      after(:each) { available?(1, 0, 5, rental_class: rental_class) }

      it 'gets correct rental' do
        expect(rental_class).to receive(:first).with(1)
      end

      it 'calls rental #available?' do
        expect(rental).to receive(:available?).with(0..5)
      end
    end
  end
end
