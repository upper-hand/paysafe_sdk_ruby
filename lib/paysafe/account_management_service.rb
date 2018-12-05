module Paysafe
  class AccountManagementService
    def initialize client
      @client = client # PaysafeApiClient
      @uri = "/accountmanagement/v1" # URI for Account Management API
    end

    def available?
      request = Request.new(
        method: Request::GET,
        uri: "/accountmanagement/monitor",
      )

      response = @client.process_request request

      response.status == "READY"
    end

    def createMerchantEntity merchantEntity
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/merchants"),
        body: merchantEntity.get(
          required = ['name']
        )
      )

      response = @client.process_request request
      AccountManagement::MerchantEntity::new response
    end

    def createMerchantAccount merchantAccount
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/merchants/#{merchantAccount.merchantId}/accounts"),
        body: merchantAccount.get(
          required = [
            'name',
            'legalEntity',
            'url',
            'currency',
            'region',
            'phone',
            'category',
            'averageTransactionAmount',
            'yearlyVolumeRange',
            'merchantDescriptor',
            'productCode',
            'usAccountDetails'
          ],
          ignore = ['merchantId']
        )
      )

      response = @client.process_request request
      AccountManagement::MerchantAccount::new response
    end

    def createMerchantAccountAddress merchantAccountAddress
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{merchantAccountAddress.accountId}/addresses"),
        body: merchantAccountAddress.get(
          required = ['street', 'city', 'state', 'country', 'zip'],
          ignore = ['accountId']
        )
      )

      response = @client.process_request request
      AccountManagement::MerchantAccountAddress::new response
    end

    def createBusinessOwner businessOwner
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{businessOwner.accountId}/businessowners"),
        body: businessOwner.get(
          required = [
            'firstName',
            'lastName',
            'jobTitle',
            'phone',
            'dateOfBirth',
            'ssn',
            'isApplicant',
            'currentAddress'
          ],
          ignore = ['accountId']
        )
      )

      response = @client.process_request request
      AccountManagement::BusinessOwner::new response
    end

    def createBusinessOwnerAddress businessOwnerAddress
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/businessowners/#{businessOwnerAddress.businessOwnerId}/currentaddresses"),
        body: businessOwnerAddress.get(
          required = ['street', 'city', 'state', 'zip', 'country'],
          ignore = ['businessOwnerId']
        )
      )

      response = @client.process_request request
      AccountManagement::BusinessOwnerAddress::new response
    end

    def createUser user
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{user.accountId}/users"),
        body: user.get(
          required = ['userName', 'password', 'email', 'recoveryQuestion'],
          ignore = ['accountId']
        )
      )

      response = @client.process_request request
      AccountManagement::User::new response
    end

    def createACHBankAcccount bankAccount
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{bankAccount.accountId}/achbankaccounts"),
        body: bankAccount.get(
          required = ['accountNumber', 'routingNumber'],
          ignore = ['accountId']
        )
      )

      response = @client.process_request request
      AccountManagement::ACHBankAccount::new response
    end

    def fetchBankAccount id
      request = Request.new(
        method: Request::GET,
        uri: prepare_uri("/achbankaccounts/#{id}"),
      )

      response = @client.process_request request
      AccountManagement::ACHBankAccount::new response
    end

    def acceptTermsAndConditions acceptance
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{acceptance.accountId}/termsandconditions"),
        body: acceptance.get(
          required = ['version'],
          ignore = ['accountId']
        )
      )

      response = @client.process_request request
      AccountManagement::TermsAndConditionsAcceptance::new response
    end

    def getTermsAndConditions merchantAccountId
      request = Request.new(
        method: Request::GET,
        uri: prepare_uri("/accounts/#{merchantAccountId}/termsandconditions")
      )

      response = @client.process_request(request, raw_response: true)
      raw_version = response['x_terms_version']
      version = raw_version.present?  ? raw_version.split(" ").last : ""
      {terms: response.body.force_encoding('utf-8'), version: version}
    end

    def initiateIdentityVerification identityVerification
      request = Request.new(
        method: Request::POST,
        uri: "/identity/v1/accounts/#{identityVerification.KYCAccountId}/identifications",
        body: identityVerification.get(
          required = ['merchantRefNum', 'profile'],
          ignore = ['KYCAccountId']
        )
      )

      response = @client.process_request request
      Paysafe::AccountManagement::IdentityVerificationResponse::new response
    end

    def answerChallenges answers
      request = Request.new(
        method: Request::PUT,
        uri: "/identity/v1/accounts/#{answers.KYCAccountId}/identifications/#{answers.responseId}/challengeQuestions/#{answers.questionSetId}",
        body: answers.get()["answers"]
      )

      response = @client.process_request request
      Paysafe::AccountManagement::AnswerChallengeResponse::new response
    end

    def completeIdentityVerification identityVerification
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{identityVerification.accountId}/identity"),
        body: identityVerification.get(
          required=['identityId'],
          ignore = ['accountId']
        )
      )

      @client.process_request request
    end

    def submitMerchantAccountForActivation accountId
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/accounts/#{accountId}/activation"),
        body: {}
      )

      @client.process_request request
    end

    def beginBankVerification bankAccountId
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/bankaccounts/#{bankAccountId}/microdeposits"),
        body: {}
      )

      @client.process_request request
    end

    def completeBankVerification validation
      request = Request.new(
        method: Request::POST,
        uri: prepare_uri("/microdeposits/#{validation.microdepositID}/validate"),
        body: validation.get(
          required = ['amount'],
          ignore = ['microdepositID']
        )
      )

      @client.process_request request
    end

    private

    # Prepare URI for submission to the API
    def prepare_uri path
      "#{@uri}#{path}"
    end
  end
end
