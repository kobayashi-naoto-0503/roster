module NursesHelper
  
  def department_select
    departments = Department.all
    department_hash = {}
    departments.each do |department|
      department_hash[department.department] = department.id
    end
    return department_hash
  end
  
end
