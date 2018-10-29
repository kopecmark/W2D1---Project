class Employee
  attr_reader :salary, :name
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end
  
  def bonus(multiplier)
    muliplier * @salary
  end
end

class Manager < Employee
  def initialize(name)
    @name = name
    @employees = []
  end
  
  def add_employees(person)
    if person.boss == @name
      @employees << person
    end
  end
  
  def bonus(multiplier)
    total_salary = 0 
    total_salary = @employees.salary.reduce(:+)
    multiplier * total_salary
  end
end

ned = Employee.new("Ned", "Founder", 1000000, nil)