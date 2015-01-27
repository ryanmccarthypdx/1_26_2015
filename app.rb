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
  redirect("/")
end

post("/employee_post") do
  employee_name = params.fetch('employee_name')
  employee_division_id = params.fetch('division_id')
  Employee.new({:name => employee_name, :division_id => employee_division_id }).save()
  redirect("/")
end

delete("/employee_fire") do
  fired_employee_id = params.fetch("fired_employee")
  if fired_employee_id.==("Choose the poor bastard")
    redirect('/')
  else
    Employee.destroy(fired_employee_id)
  end
  redirect('/')
end

delete("/division_fire") do
  @fired_division_id = params.fetch("fired_division")
  if @fired_division_id.==("Choose the poor bastards")
    redirect('/')
  else
    Division.destroy(@fired_division_id)

  end
  redirect('/')
end
