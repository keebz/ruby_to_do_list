class List
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
end
