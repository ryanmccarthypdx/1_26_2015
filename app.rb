require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get("/") do
  @employee_list = Employee.all()
  @division_list = Division.all()
  erb(:main)
end

post("/division_post") do
  division_name = params.fetch('division_name')
  Division.new({:name => division_name}).save()
  @employee_list = Employee.all()
  @division_list = Division.all()
  erb(:main)
end

post("/employee_post") do
  employee_name = params.fetch('employee_name')
  employee_division_id = params.fetch('division_id')
  Employee.new({:name => employee_name, :division_id => employee_division_id }).save()
  @employee_list = Employee.all()
  @division_list = Division.all()
  erb(:main)
end


# delete("/division_erase") do
#
#
#   @employee_list = Employee.all()
#   @division_list = Division.all()
#   erb(:main)
# end
