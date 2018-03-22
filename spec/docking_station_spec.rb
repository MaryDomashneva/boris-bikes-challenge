require 'docking_station'
INITIAL_BIKES = 20

describe DockingStation do

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  context 'when release bike' do
    context 'when has free bike' do
      it 'actually releases  a working bike' do
        docking_station = DockingStation.new(15, 20)
        broken_bike = Bike.new(false)
        working_bike = Bike.new(true)
        docking_station.return_bike(working_bike)
        docking_station.return_bike(broken_bike)
        expect(docking_station.release_bike).to eq(working_bike)
      end

      it 'removes the bike from bike storage' do
        docking_station = DockingStation.new(nil,1)
        expect(docking_station.bikes_storage.count).to eq(1)
        docking_station.release_bike
        expect(docking_station.bikes_storage.count).to eq(0)
      end
    end

    context 'when has no bikes' do
      it 'raises an error' do
         expect { DockingStation.new(nil, 0).release_bike }.to raise_error('No bikes!')
       end
    end
  end

  it 'is possible to return bike to the docking station.
    Docking ststion takes 1 argument' do
      expect(subject).to respond_to(:return_bike).with(1).argument
  end

  context 'when return bike' do
    let(:bike) { return Bike.new }

    context 'when station is full' do
      it 'raises error' do
        expect { subject.return_bike(bike) }.to raise_error('Docking station is full!')
      end
    end

    context 'when station is not full' do
      let(:docking_station) { return DockingStation.new(0, 1) }

      it 'stores the bike' do
        docking_station.return_bike(bike)
        expect(docking_station.bikes_storage.count).to eq(1)
        expect(docking_station.bikes_storage[0]).to eq(bike)
      end
    end
  end

  it 'allows to access docked bikes' do
    expect(subject).to respond_to(:bikes_storage)
  end
end
