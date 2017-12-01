describe 'Helpers'  do
  let(:start) { 1 }
  let(:finish) { 3 }
  let(:params) { { start: start,  finish: finish } }

  let(:rental) { double(:rental, available?: true, book: nil, to_h: { a: 1 }) }
  let(:rental_class) do 
    double(:rental_class, all: [{ a: 1 }], first: rental, get: rental)
  end

  describe '#rentals_to_json' do
    it 'converts rental objects to json' do
      expect(rentals_to_json(rental_class: rental_class)).to eq '[{"a":1}]'
    end
  end

  describe '#rental_to_json' do
    after(:each) { rental_to_json(1, rental_class: rental_class) }

    it 'gets correct rental' do
      expect(rental_class).to receive(:get).with(1)
    end

    it 'converts single rental object to json' do
      expect(rental_to_json(1, rental_class: rental_class)).to eq '{"a":1}'
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
    end
    
    context 'when returning json' do
      it 'returns output of json converter' do
        expect(available?(1, start, finish, rental_class: rental_class))
          .to eq true
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
      before(:each) { allow(self).to receive(:available?).and_return(true) }
      after(:each) { book(1, start, finish, rental_class: rental_class) }

      it 'gets correct rental' do
        expect(rental_class).to receive(:get).with(1)
      end

      it 'calls rental #book with range' do
        expect(rental).to receive(:book).with(start..finish)
      end
    end

    context 'when giving dates that are not available' do
      before(:each) { allow(self).to receive(:available?).and_return(false) }

      it 'returns 409 status' do
        expect(book(1, start, finish, rental_class: rental_class)).to equal 409
      end
    end

    context 'when giving non-existent rental' do
      before(:each) { allow(rental_class).to receive(:get).and_return(nil) }

      it 'returns 409 status' do
        expect(book(1, start, finish, rental_class: rental_class)).to equal 404
      end
    end
  end
end
