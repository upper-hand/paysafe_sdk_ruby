module Paysafe
  module AccountManagement
    class BankAccountValidation < JsonObject
      attr_accessor :microdepositID
      attr_accessor :amount
    end
  end
end
