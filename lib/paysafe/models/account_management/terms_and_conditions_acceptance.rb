module Paysafe
  module AccountManagement
    class TermsAndConditionsAcceptance < JsonObject
      attr_accessor :id
      attr_accessor :accountId
      attr_accessor :version
      attr_accessor :acceptanceDate
    end
  end
end
