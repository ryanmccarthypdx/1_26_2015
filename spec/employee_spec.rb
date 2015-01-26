require('spec_helper')

describe(Employee) do
  it("tells which division it belongs to") do
    division = Division.create({ :name => "division" })
    employee = Employee.create({ :name => "Marge Simpson", :division_id => division.id() })
    expect(employee.division()).to(eq(division))
  end
end
