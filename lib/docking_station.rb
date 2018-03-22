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
      @bikes_storage.pop
    end
  end

  def return_bike(bike, bike_condition)
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
  def initialize
    @condition = true
  end

  def mark_condition(bike_condition)
    @condition = bike_condition
  end

  def working?
    return @condition
  end
end

DockingStation.new
