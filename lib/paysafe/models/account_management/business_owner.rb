module Paysafe
  module AccountManagement
    class BusinessOwner < JsonObject
      attr_accessor :id
      attr_accessor :accountId
      attr_accessor :firstName
      attr_accessor :middleName
      attr_accessor :lastName
      attr_accessor :email
      attr_accessor :jobTitle
      attr_accessor :phone
      attr_accessor :dateOfBirth
      attr_accessor :ssn
      attr_accessor :isApplicant
      attr_accessor :currentAddress
    end
  end
end
