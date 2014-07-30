class List
  @@all_list = []

  def initialize(location)
    @location = location
    @tasks = []
  end

  def location
    @location
  end

  def tasks
    @tasks
  end

  def add_task(task)
    @tasks << task
  end

  def List.all
    @@all_list
  end

  def save
    @@all_list << self
  end

  def List.clear
    @@all_list = []
  end

end
