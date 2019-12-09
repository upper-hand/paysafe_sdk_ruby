module Paysafe
  module AccountManagement
    class AnswerChallengeResponse < JsonObject
      attr_accessor :id
      attr_accessor :status
      attr_accessor :gatewayRawResponse
      attr_accessor :links
    end
  end
end
