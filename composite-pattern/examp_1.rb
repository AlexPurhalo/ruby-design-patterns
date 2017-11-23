class Task # The Component class
  def initialize(name)
    @name = name
  end

  attr_reader :name

  def get_time_required
    0.0
  end
end

class AddDryIngredientsTask < Task # The Leaf class (subclass of Task)
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0 # 1 minute to add flour and sugar
  end
end

class AddLiquidsTask < Task # The Leaf class
  def initialize
    super('Add liquids')
  end

  def get_time_required
    0.5 # Half minute to add liquids
  end
end

class MixTask < Task # The Leaf class
  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3.0 # Mix for 3 minutes
  end
end

class CompositeTask < Task # Abstract class
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    @sub_tasks.inject(0.0) do |time, task|
      time + task.get_time_required
    end
  end
end

class MakeBatterTask < CompositeTask # The Composite task (subclass of CompositeTask)
  def initialize
    super('Make batter')
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(AddLiquidsTask.new)
    add_sub_task(MixTask.new)
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    add_sub_task(MakeBatterTask.new)
    # add_sub_task(FillPanTask.new)
    # add_sub_task(BakeTask.new)
    # add_sub_task(FrostTask.new)
    # add_sub_task(LickSpoonTask.new)
  end
end

composite = MakeCakeTask.new
puts composite.get_time_required