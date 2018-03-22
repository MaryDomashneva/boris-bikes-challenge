require 'docking_station'
INITIAL_BIKES = 20

describe DockingStation do

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  context 'when release bike' do
    context 'when has free bike' do
      it 'actually releases a working bike' do
        working_bike = Bike.new
        working_bike.mark_condition(true)
        broken_bike = Bike.new
        broken_bike.mark_condition(false)
        released_bike = DockingStation.new(2, [working_bike, broken_bike]).release_bike
        expect(released_bike).to eq(working_bike)
      end

      it 'removes the bike from bike storage' do
        docking_station = DockingStation.new(1)
        expect(docking_station.bikes_storage.count).to eq(1)
        docking_station.release_bike
        expect(docking_station.bikes_storage.count).to eq(0)
      end
    end

    context 'when has no bikes' do
      it "raises an error" do
         expect { DockingStation.new(0).release_bike }.to raise_error("No bikes!")
       end
    end
  end

  it 'is possible to return bike to the docking station.
    Docking ststion takes 1 argument' do
      expect(subject).to respond_to(:return_bike).with(2).argument
  end

  context 'when return bike' do
    let(:bike) { return Bike.new }

    context 'when station is full' do
      it 'raises error' do
        expect { subject.return_bike(bike, true) }.to raise_error("Docking station is full!")
      end
    end

    context 'when station is not full' do
      let(:docking_station) { return DockingStation.new(1, []) }

      it 'stores the bike' do
        docking_station.return_bike(bike, true)
        expect(docking_station.bikes_storage.count).to eq(1)
        expect(docking_station.bikes_storage[0]).to eq(bike)
      end
    end
  end

  it 'allows to access docked bikes' do
    expect(subject).to respond_to(:bikes_storage)
  end
end
