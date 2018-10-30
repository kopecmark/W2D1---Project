require 'byebug'

class Employee
  attr_reader :salary, :name, :boss
  def initialize(name, title, salary, boss=nil)
    @name, @title, @salary = name, title, salary
    # self.create_boss(boss)
    
    self.boss = boss 
    # @boss = boss
  end
  
  def boss=(boss)
    # debugger
    @boss = boss
    boss.add_employees(self) unless boss.nil?
    boss
  end
  
  def bonus(multiplier)
    multiplier * @salary
  end
  
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss=nil)
    # @name = super.boss
    super
    @employees = []
  end
  
  def add_employees(subordinate)
    @employees << subordinate
    subordinate
  end
  
  def bonus(multiplier)
  
    multiplier * self.total_salary
  end
  
  def total_salary
    total = 0 
    # debugger
    employees.each do |employee|
      # debugger
      if employee.is_a?(Manager)
        total+= employee.salary+employee.total_salary
      else
        total += employee.salary
      end
    end
    total 
  end
end

ned = Manager.new("Ned", "Founder", 100000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
# p david.boss
# p david.employees
