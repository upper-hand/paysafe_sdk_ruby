module Paysafe
  module AccountManagement
    class ACHBankAccount < JsonObject
      attr_accessor :id
      attr_accessor :accountId
      attr_accessor :accountNumber
      attr_accessor :routingNumber
    end
  end
end
