class Subject
  def initialize
    @observers=[]
  end
  def add_observer(observer)
    @observers << observer
  end
  def delete_observer(observer)
    @observers.delete(observer)
  end
  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Employee < Subject
  def initialize( name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  attr_reader :name, :title
  attr_reader :salary

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

class Payroll # Observe class
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan # Observe class
  def update( changed_employee )
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end

fred = Employee.new('Fred', 'Crane Operator', 30000.0)

payroll = Payroll.new
fred.add_observer( payroll )

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary=90000.0
