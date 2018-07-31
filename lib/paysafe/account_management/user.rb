module Paysafe
  module AccountManagement
    class User < JsonObject
      attr_accessor :id
      attr_accessor :accountId
      attr_accessor :userName
      attr_accessor :password
      attr_accessor :email
      attr_accessor :recoveryQuestion
    end
  end
end
