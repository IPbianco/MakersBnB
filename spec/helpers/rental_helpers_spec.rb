describe 'Helpers'  do
  
  let(:rental) { double('rental', all: [1, 2, 3]) }

  describe '#get_rentals' do
    it 'converts rental object to json' do
      expect(get_rentals(rental_class: rental)).to eq '[1,2,3]'
    end
  end
end
