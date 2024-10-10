# typed: true
require 'sorbet-runtime'

extend T::Sig

# we use currying with type and schema differenly so we can use Polymorphism.
# For now it's redundant as I funned it into a arity 2 function
sig do
  type_parameters(:T).params(
    type: T::Class[T.type_parameter(:T)]
  ).returns(
    T.proc.params(
      validations_schema: T.proc.params(data: T.untyped).returns(T::Hash[T.untyped, T.untyped])
    ).returns(
      T.proc.params(
        data: T.untyped
      ).returns(T.type_parameter(:T))
    )
  )
end
def validate_and_cast_curried(type)
  -> (validations_schema) {
    -> (data) {
      result = validations_schema.call(data)
      if result.success?
        result_hash = result.to_h
        T.unsafe(type).new(**result_hash)
      else
        error_messages = result.errors.to_h.map { |field, errors| "#{field}: #{errors.join(', ')}" }.join("; ")
        raise "Validation failed: #{error_messages}"
      end
    }
  }
end

sig do
  type_parameters(:T).params(
    type: T::Class[T.type_parameter(:T)],
    validations_schema: T.untyped
  ).returns(
    T.proc.params(
      data: T.untyped
    ).returns(T.type_parameter(:T))
  )
end
def create_validation(type, validations_schema)
  -> (data) {
    validate_and_cast_curried(type).call(validations_schema).call(data)
  }
end
