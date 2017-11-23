# Just example but wrong way (inherit form Array)
class Task # Abstract class
  attr_reader :name
  def initialize(name); @name = name; end
  def get_time_required; 0.0; end
end

class CompositeTask < Array # Abstract class
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    inject(0.0) do |time, task|
      time + task.get_time_required
    end
  end
end

# The Leaf classes
class AddDryIngredientsTask < Task
  def initialize; super('Add dry ingredients'); end
  def get_time_required; 1.0; end
end

class AddLiquidsTask < Task
  def initialize; super('Add liquids'); end
  def get_time_required; 0.5; end
end

class MixTask < Task
  def initialize; super('Mix that batter up!'); end
  def get_time_required; 3.0; end
end

composite = CompositeTask.new('Make batter')

composite << AddDryIngredientsTask.new
puts composite.get_time_required

composite << AddLiquidsTask.new
puts composite[1].get_time_required

composite[2] = MixTask.new
puts composite[2].get_time_required
