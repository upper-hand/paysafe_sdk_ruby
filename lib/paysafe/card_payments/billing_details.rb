module Paysafe
  module CardPayments
    class BillingDetails < JsonObject
      attr_accessor :street
      attr_accessor :street2
      attr_accessor :city
      attr_accessor :state
      attr_accessor :country
      attr_accessor :zip
      attr_accessor :phone
    end
  end
end