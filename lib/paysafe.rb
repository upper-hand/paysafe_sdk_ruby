# frozen_string_literal: true

require 'paysafe/version'

require 'paysafe/environment'
require 'paysafe/json_object'
require 'paysafe/paysafe_api_client'
require 'paysafe/pagerator'
require 'paysafe/request'

require 'paysafe/services/account_management_service'
require 'paysafe/services/card_payment_service'
require 'paysafe/services/customer_vault_service'
require 'paysafe/services/direct_debit_service'
require 'paysafe/services/three_d_secure_service'

require 'paysafe/errors/api'
require 'paysafe/errors/entity_not_found'
require 'paysafe/errors/invalid_credentials'
require 'paysafe/errors/invalid_request'
require 'paysafe/errors/paysafe'
require 'paysafe/errors/permission'
require 'paysafe/errors/request_conflict'
require 'paysafe/errors/request_declined'

require 'paysafe/models/account_management/ach_bank_account'
require 'paysafe/models/account_management/answer_challenge_request'
require 'paysafe/models/account_management/answer_challenge_response'
require 'paysafe/models/account_management/bank_account_validation'
require 'paysafe/models/account_management/business_owner'
require 'paysafe/models/account_management/business_owner_address'
require 'paysafe/models/account_management/complete_identity_verification'
require 'paysafe/models/account_management/merchant_account'
require 'paysafe/models/account_management/merchant_account_address'
require 'paysafe/models/account_management/merchant_entity'
require 'paysafe/models/account_management/identity_verification_request'
require 'paysafe/models/account_management/identity_verification_response'
require 'paysafe/models/account_management/terms_and_conditions_acceptance'
require 'paysafe/models/account_management/user'

require 'paysafe/models/card_payments/authentication'
require 'paysafe/models/card_payments/authorization'
require 'paysafe/models/card_payments/authorization_reversal'
require 'paysafe/models/card_payments/billing_details'
require 'paysafe/models/card_payments/profile'
require 'paysafe/models/card_payments/refund'
require 'paysafe/models/card_payments/settlement'
require 'paysafe/models/card_payments/shipping_details'
require 'paysafe/models/card_payments/verification'

require 'paysafe/models/customer_vault/ach_bank_account'
require 'paysafe/models/customer_vault/address'
require 'paysafe/models/customer_vault/bacs_bank_account'
require 'paysafe/models/customer_vault/bank_account'
require 'paysafe/models/customer_vault/card'
require 'paysafe/models/customer_vault/eft_bank_account'
require 'paysafe/models/customer_vault/mandate'
require 'paysafe/models/customer_vault/profile'
require 'paysafe/models/customer_vault/sepa_bank_account'

require 'paysafe/models/direct_debit/ach'
require 'paysafe/models/direct_debit/bacs'
require 'paysafe/models/direct_debit/billing_details'
require 'paysafe/models/direct_debit/eft'
require 'paysafe/models/direct_debit/profile'
require 'paysafe/models/direct_debit/purchase'
require 'paysafe/models/direct_debit/shipping_details'
require 'paysafe/models/direct_debit/standalone_credits'

require 'paysafe/models/three_d_secure/authentications'
require 'paysafe/models/three_d_secure/card'
require 'paysafe/models/three_d_secure/card_expiry'
require 'paysafe/models/three_d_secure/enrollment_checks'
require 'paysafe/models/three_d_secure/error'

module Paysafe
  <<-DOC
 * Copyright (c) 2016 Paysafe
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 * associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute,
 * sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
 * NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  DOC
end
