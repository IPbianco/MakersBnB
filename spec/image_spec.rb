describe ImageUploader do
  let(:rental_class) { double(:rental_class, count: 1) }
  let(:file) { double(:file, extension: 'png') }

  subject { described_class.new }

  describe '#filename' do
    before(:each) { allow(subject).to receive(:file).and_return(file) }

    it 'gets last Rental ID number' do
      expect(subject.filename(rental_class: rental_class)).to eq '1.png'
    end
  end
end
