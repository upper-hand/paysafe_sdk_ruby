# frozen_string_literal: true

module Paysafe
  class AccountManagementService
    extend Gem::Deprecate

    def initialize(client)
      @client = client # PaysafeApiClient
      @uri = '/accountmanagement/v1' # URI for Account Management API
    end

    def available?
      request = Request.new(
        method: Request::GET,
        uri: '/accountmanagement/monitor',
      )

      response = @client.process_request request

      response.status == 'READY'
    end

    def create_merchant_entity(merchant_entity)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri('/merchants'),
        body: merchant_entity.get(['name']),
      )

      response = @client.process_request request
      AccountManagement::MerchantEntity.new response
    end

    alias createMerchantEntity create_merchant_entity
    deprecate(
      'createMerchantEntity',
      :create_merchant_entity,
      2020,
      2,
    )

    def create_merchant_account(merchant_account)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/merchants/#{merchant_account.merchantId}/accounts"),
        body: merchant_account.get(
          %w[
            name
            legalEntity
            url
            currency
            region
            phone
            category
            averageTransactionAmount
            yearlyVolumeRange
            merchantDescriptor
            productCode
            usAccountDetails
          ],
          ['merchantId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::MerchantAccount.new response
    end

    alias createMerchantAccount create_merchant_account
    deprecate(
      'createMerchantAccount',
      :create_merchant_account,
      2020,
      2,
    )

    def create_merchant_account_address(merchant_address)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{merchant_address.accountId}/addresses"),
        body: merchant_address.get(
          %w[street city state country zip],
          ['accountId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::MerchantAccountAddress.new response
    end

    alias createMerchantAccountAddress create_merchant_account_address
    deprecate(
      'createMerchantAccountAddress',
      :create_merchant_account,
      2020,
      2,
    )

    def create_business_owner(business_owner)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{business_owner.accountId}/businessowners"),
        body: business_owner.get(
          %w[
            firstName
            lastName
            jobTitle
            phone
            dateOfBirth
            ssn
            isApplicant
            currentAddress
          ],
          ['accountId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::BusinessOwner.new response
    end

    alias createBusinessOwner create_business_owner
    deprecate(
      'createBusinessOwner',
      :create_business_owner,
      2020,
      2,
    )

    def create_business_owner_address(owner_address)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/businessowners/#{owner_address.businessOwnerId}/currentaddresses"),
        body: owner_address.get(
          %w[street city state zip country],
          ['businessOwnerId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::BusinessOwnerAddress.new response
    end

    alias createBusinessOwnerAddress create_business_owner_address
    deprecate(
      'createBusinessOwnerAddress',
      :create_business_owner_address,
      2020,
      2,
    )

    def create_user(user)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{user.accountId}/users"),
        body: user.get(
          %w[userName password email recoveryQuestion],
          ['accountId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::User.new response
    end

    alias createUser create_user
    deprecate(
      'createUser',
      :create_user,
      2020,
      2,
    )

    def create_ach_bank_account(bank_account)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{bank_account.accountId}/achbankaccounts"),
        body: bank_account.get(
          %w[accountNumber routingNumber],
          ['accountId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::ACHBankAccount.new response
    end

    alias createACHBankAcccount create_ach_bank_account
    deprecate(
      'createACHBankAcccount',
      :create_ach_bank_account,
      2020,
      2,
    )

    def fetch_bank_account(id)
      request = Request.new(
        method: Request::GET,
        uri: prepare_uri("/achbankaccounts/#{id}"),
      )

      response = @client.process_request request
      AccountManagement::ACHBankAccount.new response
    end

    alias fetchBankAccount fetch_bank_account
    deprecate(
      'fetchBankAccount',
      :fetch_bank_account,
      2020,
      2,
    )

    def accept_terms_and_conditions(acceptance)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{acceptance.accountId}/termsandconditions"),
        body: acceptance.get(
          ['version'],
          ['accountId'],
        ),
      )

      response = @client.process_request request
      AccountManagement::TermsAndConditionsAcceptance.new response
    end

    alias acceptTermsAndConditions accept_terms_and_conditions
    deprecate(
      'acceptTermsAndConditions',
      :accept_terms_and_conditions,
      2020,
      2,
    )

    def get_terms_and_conditions(merchant_account_id)
      request = Request.new(
        method: Request::GET,
        uri: prepare_uri("/accounts/#{merchant_account_id}/termsandconditions"),
      )

      response = @client.process_request(request, raw_response: true)
      raw_version = response['x_terms_version']
      version = raw_version.present? ? raw_version.split(' ').last : ''
      {terms: response.body.force_encoding('utf-8'), version: version}
    end

    alias getTermsAndConditions get_terms_and_conditions
    deprecate(
      'getTermsAndConditions',
      :get_terms_and_conditions,
      2020,
      2,
    )

    def initiate_identity_verification(verification)
      request = Request.new(
        method: Request::POST,
        uri: "/identity/v1/accounts/#{verification.KYCAccountId}/identifications",
        body: verification.get(
          %w[merchantRefNum profile],
          ['KYCAccountId'],
        ),
      )

      response = @client.process_request request
      Paysafe::AccountManagement::IdentityVerificationResponse.new response
    end

    alias initiateIdentityVerification initiate_identity_verification
    deprecate(
      'initiateIdentityVerification',
      :initiate_identity_verification,
      2020,
      2,
    )

    def answer_challenges(answers)
      request = Request.new(
        method: Request::PUT,
        uri: "/identity/v1/accounts/#{answers.KYCAccountId}/identifications/
              #{answers.responseId}/challengeQuestions/#{answers.questionSetId}",
        body: answers.get['answers'],
      )

      response = @client.process_request request
      Paysafe::AccountManagement::AnswerChallengeResponse.new response
    end

    alias answerChallenges answer_challenges
    deprecate(
      'answerChallenges',
      :answer_challenges,
      2020,
      2,
    )

    def complete_identity_verification(verification)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{verification.accountId}/identity"),
        body: verification.get(
          ['identityId'],
          ['accountId'],
        ),
      )

      @client.process_request request
    end

    alias completeIdentityVerification complete_identity_verification
    deprecate(
      'completeIdentityVerification',
      :complete_identity_verification,
      2020,
      2,
    )

    def submit_merchant_account_for_activation(account_id)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{account_id}/activation"),
        body: {},
      )

      @client.process_request request
    end

    alias submitMerchantAccountForActivation submit_merchant_account_for_activation
    deprecate(
      'submitMerchantAccountForActivation',
      :submit_merchant_account_for_activation,
      2020,
      2,
    )

    def begin_bank_verification(bank_account_id)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/bankaccounts/#{bank_account_id}/microdeposits"),
        body: {},
      )

      @client.process_request request
    end

    alias beginBankVerification begin_bank_verification
    deprecate(
      'beginBankVerification',
      :begin_bank_verification,
      2020,
      2,
    )

    def complete_bank_verification(validation)
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/microdeposits/#{validation.microdepositID}/validate"),
        body: validation.get(
          ['amount'],
          ['microdepositID'],
        ),
      )

      @client.process_request request
    end

    alias completeBankVerification complete_bank_verification
    deprecate(
      'completeBankVerification',
      :completeBankVerification,
      2020,
      2,
    )

  private

    # Prepare URI for submission to the API
    def prepare_uri(path)
      "#{@uri}#{path}"
    end
  end
end
