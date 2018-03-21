class DockingStation
  INITIAL_BIKES = 20

  attr_reader :bikes_storage

  def initialize(capacity = INITIAL_BIKES, initial_bikes_storage = nil)
    if initial_bikes_storage.nil?
      @bikes_storage = []
      capacity.times { @bikes_storage << Bike.new }
    else
      @bikes_storage = initial_bikes_storage
    end
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise "No bikes!"
    else
      released_bike = Bike.new
    end
  end

  def return_bike(bike)
    if full?
      raise "Docking station is full!"
    else
      @bikes_storage << bike
    end
  end

  private

  attr_reader :capacity

  def full?
    if @bikes_storage.count == @capacity
      return true
    else
      return false
    end
  end

  def empty?
    @bikes_storage.empty?
  end

end

class Bike
  def working?
    return true
  end
end

DockingStation.new
