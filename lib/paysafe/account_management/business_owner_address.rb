module Paysafe
  module AccountManagement
    class BusinessOwnerAddress < JsonObject
      attr_accessor :id
      attr_accessor :businessOwnerId
      attr_accessor :street
      attr_accessor :street2
      attr_accessor :city
      attr_accessor :state
      attr_accessor :zip
      attr_accessor :country
      attr_accessor :yearsAtAddress
    end
  end
end
