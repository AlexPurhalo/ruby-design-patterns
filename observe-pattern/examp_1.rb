class Employee
  def initialize( name, title, salary, payroll )
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  attr_reader   :name, :title, :salary

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end

class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

payroll = Payroll.new
fred = Employee.new('Fred', 'Crane Operator', 30000, payroll)
fred.salary = 35000
puts fred







