module Paysafe
  module AccountManagement
    class CompleteIdentityVerification < JsonObject
      attr_accessor :accountId
      attr_accessor :identityId
    end
  end
end
