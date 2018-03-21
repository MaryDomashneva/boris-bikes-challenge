require 'docking_station'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'actually releases a bike' do
    #first, we returning the bike because it is only one method apart of
    #release_bike that can create a bike! So we do it in purpuse, do not let array be empty.
    #So our array @bikes should contain something
    first_bike = Bike.new
    subject.return_bike(first_bike)
    #and now, when we have something in our array @bike, we could release it
    #and check if the instance is Bike
    released_bike = subject.release_bike
    expect(released_bike).to be_a_kind_of(Bike)
  end

  it "is possible to return buke to the docking station" do
    expect(subject).to respond_to(:return_bike).with(1).argument
  end

  it "allows to access docked bikes" do
    expect(subject).to respond_to(:bikes_storage)
  end

  it "stores returned bikes" do
    #we deleted a second bike here for a reasone. Because we have a temporarry condition
    #that @bikes.count >= 1 We can store only one bike
    expect(subject.bikes_storage.length).to eq 20
  end

 it "raises an error when user requests a
    bike but docking station has no bikes" do
    subject.bikes_storage.clear
    expect { subject.release_bike }.to raise_error("No bikes!")
  end

  it "raise an error when user try to dock a bike
    when the capacity is full" do
      #The array will be raised because we are trying to store more than 20 bike
      first_bike = Bike.new
      subject.return_bike(first_bike)
      second_bike = Bike.new
      expect { subject.return_bike(second_bike) }.to raise_error("Docking station is full!")
    end
end
