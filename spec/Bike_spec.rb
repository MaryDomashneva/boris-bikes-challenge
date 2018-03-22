require 'docking_station'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to :working?
  end

  it 'can be marked as good or broken' do
    expect(subject).to respond_to(:mark_condition).with(1).argument
  end

  context 'when is not working' do
    let(:bike_condition) {return false}
    it 'marked as broken' do
      subject.mark_condition(bike_condition)
      expect(subject.working?).to be_falsey
    end
  end

  context 'when is working' do
    let(:bike_condition) {return true}
    it 'marked as working' do
      subject.mark_condition(bike_condition)
      expect(subject.working?).to be_truthy
    end
  end
end
