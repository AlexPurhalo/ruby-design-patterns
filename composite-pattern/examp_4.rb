class Task # Abstract class
  def initialize(name)
    @name = name
    @parent = nil
  end

  attr_accessor :name, :parent

  def get_time_required; 0.0; end
end

class CompositeTask < Task # Abstract class
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.inject(0.0) do |time, task|
      time + task.get_time_required
    end
  end
end

# The Leaf classes
class AddDryIngredientsTask < Task
  def initialize; super('Add dry ingredients'); end
  def get_time_required; 1.0; end
end

composite = CompositeTask.new('Make batter')

composite << AddDryIngredientsTask.new
puts composite[0].parent.name

