module Paysafe
  module AccountManagement
    class IdentityVerificationRequest < JsonObject
      attr_accessor :KYCAccountId
      attr_accessor :merchantRefNum
      attr_accessor :profile
      attr_accessor :customerIp
    end
  end
end
