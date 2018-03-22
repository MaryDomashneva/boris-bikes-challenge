class DockingStation
  INITIAL_BIKES = 20

  attr_reader :bikes_storage

  def initialize(initia_number = nil, capacity = INITIAL_BIKES)
    @bikes_storage = []
    @capacity = capacity
    if initia_number.nil?
      capacity.times { @bikes_storage << Bike.new }
    else
      initia_number.times { @bikes_storage << Bike.new }
    end

  end

  def release_bike
     if empty? || !@bikes_storage.any? {|bike| bike.working?}
       raise 'No bikes!'
     else
       @bikes_storage.delete_at(@bikes_storage.index {|bike| bike.working? })
     end
   end

  def return_bike(bike)
    if full?
      raise 'Docking station is full!'
    else
      @bikes_storage << bike
    end
  end

  private

  attr_reader :capacity

  def full?
    @bikes_storage.count >= @capacity
  end

  def empty?
    @bikes_storage.empty?
  end

end

class Bike
  def initialize(condition = true)
    @condition = condition
  end

  def ==(other)
    other.instance_of?(self.class) && working? ==  other.working?
  end

  def mark_condition(bike_condition)
    @condition = bike_condition
  end

  def working?
    return @condition
  end
end
