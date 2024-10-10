# Validations.rb
# typed: strict
require 'sorbet-runtime'
require_relative 'previred_payroll'
require_relative 'helpers/validate_and_cast_builder'

extend T::Sig

sig { params(data: T.untyped).returns(PreviredPayrollStruct) }
def previred_payroll_validation(data)
 create_validation(PreviredPayrollStruct, PreviredPayrollSchema).call(data)
end

