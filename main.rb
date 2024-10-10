# typed: strict
require 'sorbet-runtime'
require_relative 'validations_schema/validations'
require_relative 'enums'
require 'date'


sig { params(input: T::Array[T.anything]).returns(T.any(Integer, Float)) }
def total_monthly_salary_expenses(input)
  payroll_data_list = input.map do |item|
    previred_payroll_validation(item)
  end

  total_salary = payroll_data_list.reduce(0) do |sum, item|
    sum + item.salary
  end

  total_salary
end


class PayrollStruct < T::Struct
  const :payroll_id, String
  const :employee_payroll_vendor_reference, String
  const :payroll_vendor, PayrollVendor  
  const :country, Country               
  const :salary, Float
  const :payment_date, Date
end

# We recieve a type anything that is "unknown" to us but we know it's a PreviredPayrollStruct
# once we are sure it's a PreviredPayrollStruct we can use the type system
sig { params(input: T.anything).returns(PayrollStruct) }
def parse_previred_payroll(input)
  
  # Type: PreviredPayrollStruct
   validated_payroll  = previred_payroll_validation(input)

   employee_id = validated_payroll.employee_id # type String
   salary = validated_payroll.salary # type  Float
   payment_date = validated_payroll.payment_date # type Date

   # all types matches 
   parsed_payroll = PayrollStruct.new(
    payroll_id: "generated_id",
    employee_payroll_vendor_reference: employee_id,
    payroll_vendor: PayrollVendor::Previred,
    country: Country::Chile,
    salary:,
    payment_date:
  )
  
  parsed_payroll
end 


begin
  payroll_data_list = [
    {
      employee_id: "123456",
      salary: 3000.50,
      payment_date: Date.today
    },
    {
      employee_id: "234567",
      salary: 4500.75,
      payment_date: Date.today
    },
    {
      employee_id: "345678",
      salary: 5200.00,
      payment_date: Date.today
    }
  ]

  previred_payroll =  payroll_data_list[0]
  parsed_payroll = parse_previred_payroll(previred_payroll)

  puts parsed_payroll: parsed_payroll
  total_salary_expenses = total_monthly_salary_expenses(payroll_data_list)
  puts "Total Salary Expenses: #{total_salary_expenses}"
rescue => e
  puts e.message
end
