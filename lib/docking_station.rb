class DockingStation
  attr_reader :bikes_storage

  def initialize
    @bikes_storage = []
    20.times do return_bike(Bike.new)
    end
    return @bikes_storage
  end

  def release_bike
    if @bikes_storage.empty?
      raise "No bikes!"
    else
      released_bike = Bike.new
    end
  end

  def return_bike(bike)
    if @bikes_storage.count >= 21
      raise "Docking station is full!"
    else
      @bikes_storage << bike
    end
  end

end

class Bike
  def working?
    return true
  end
end

DockingStation.new
