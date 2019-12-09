module Paysafe
  module AccountManagement
    class MerchantAccountAddress < JsonObject
      attr_accessor :id
      attr_accessor :accountId
      attr_accessor :street
      attr_accessor :street2
      attr_accessor :city
      attr_accessor :state
      attr_accessor :country
      attr_accessor :zip
    end
  end
end
