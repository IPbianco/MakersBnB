describe 'Helpers'  do
  let(:rental) { double(:rental, available?: true, book: nil) }
  let(:rental_class) { double(:rental_class, all: [1, 2], first: rental) }
  let(:start) { 1 }
  let(:finish) { 3 }
  let(:params) { { start: start,  finish: finish } }

  describe '#rentals_to_json' do
    it 'converts rental object to json' do
      expect(rentals_to_json(rental_class: rental_class)).to eq '[1,2]'
    end
  end

  describe '#available?' do
    context 'when getting rental object' do
      after(:each) { available?(1, start, finish, rental_class: rental_class) }

      it 'gets correct rental' do
        expect(rental_class).to receive(:first).with({ id: 1 })
      end

      it 'calls rental #available?' do
        expect(rental).to receive(:available?).with(1..3)
      end

      it 'converts to json' do
        expect(self).to receive(:availability_to_json).with(true)
      end
    end
    
    context 'when returning json' do
      before(:each) do 
        allow(self).to receive(:availability_to_json)
          .and_return('some json')
      end

      it 'returns output of json converter' do
        expect(available?(1, start, finish, rental_class: rental_class))
          .to eq 'some json'
      end
    end
  end

  describe '#availability_to_json' do
    context 'when generating json' do
      it 'puts state in json' do
        expect(availability_to_json(true)).to eq '{"available":true}'
      end
    end
  end

  describe '#parse_dates' do
    let(:date) { double(:date, parse: 'date') } 

    context 'when returning dates' do
      it 'extracts start and finish and converts to dates' do
        expect(parse_dates(params, date_class: date)).to eq ['date', 'date']
      end
    end

    context 'when generating dates' do
      after(:each) { parse_dates(params, date_class: date) }

      it 'passes correct arguments to date' do
        expect(date).to receive(:parse).twice
      end
    end
  end
  
  describe '#book' do
    context 'when given valid date range' do
      before(:each) { allow(rental).to receive(:available?).and_return(true) }
      after(:each) { book(1, start, finish, rental_class: rental_class) }

      it 'gets correct rental' do
        expect(rental_class).to receive(:first).with({ id: 1 })
      end

      it 'calls rental #book with range' do
        expect(rental).to receive(:book).with(start..finish)
      end
    end

    context 'when giving dates that are not available' do
      before(:each) { allow(rental).to receive(:available?).and_return(false) }

      it 'returns false' do
        expect(book(1, start, finish, rental_class: rental_class)).to be nil
      end
    end
  end
end
