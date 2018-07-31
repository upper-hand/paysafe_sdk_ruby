module Paysafe
  module AccountManagement
    class AnswerChallengeRequest < JsonObject
      attr_accessor :KYCAccountId
      attr_accessor :responseId
      attr_accessor :questionSetId
    end
  end
end
