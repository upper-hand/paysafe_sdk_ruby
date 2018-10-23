module Paysafe
  module AccountManagement
    class MerchantAccount < JsonObject
      attr_accessor :id
      attr_accessor :merchantId
      attr_accessor :name
      attr_accessor :legalEntity
      attr_accessor :url
      attr_accessor :currency
      attr_accessor :region
      attr_accessor :phone
      attr_accessor :category
      attr_accessor :averageTransactionAmount
      attr_accessor :yearlyVolumeRange
      attr_accessor :merchantDescriptor
      attr_accessor :productCode
      attr_accessor :usAccountDetails
      attr_accessor :address
    end
  end
end
