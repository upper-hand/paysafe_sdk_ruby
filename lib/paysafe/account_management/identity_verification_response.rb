module Paysafe
  module AccountManagement
    class IdentityVerificationResponse < JsonObject
      attr_accessor :id
      attr_accessor :status
      attr_accessor :gatewayRawResponse
      attr_accessor :followupQuestions
      attr_accessor :links
    end
  end
end
