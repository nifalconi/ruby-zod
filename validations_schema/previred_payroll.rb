# typed: false
# payment.rb
require 'dry-validation'
require 'sorbet-runtime'

PreviredPayrollSchema = Dry::Schema.Params do
  required(:employee_id).filled(:string)
  required(:salary).filled(:float, gt?: 0)
  required(:payment_date).filled(:date)
end

class PreviredPayrollStruct < T::Struct
  const :employee_id, String
  const :salary, Float
  const :payment_date, Date
end