class Country < T::Enum
  enums do
    Chile = new
    Argentina = new
  end
end

class PayrollVendor < T::Enum
  enums do
    Previred = new
    OtherVendor = new
  end
end