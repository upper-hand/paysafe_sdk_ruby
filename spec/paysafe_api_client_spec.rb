# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Paysafe::PaysafeApiClient do
  subject(:api_client) do
    Paysafe::PaysafeApiClient.new(
      ENV['PAYSAFE_USER'],
      ENV['PAYSAFE_PASSWORD'],
    )
  end

  it 'should construct' do
    expect(api_client).to be_a Paysafe::PaysafeApiClient
  end

  it 'should use the correct testing environment' do
    expect(api_client.instance_variable_get(:@environment))
      .to eq(Paysafe::Environment::TEST)
  end

  it 'should have an Account Management Service' do
    expect(api_client.account_management_service)
      .to be_an_instance_of(Paysafe::AccountManagementService)
  end

  it 'should have a Card Payment Service' do
    expect(api_client.card_payment_service)
      .to be_an_instance_of(Paysafe::CardPaymentService)
  end

  it 'should have a Customer Vault Service' do
    expect(api_client.customer_vault_service)
      .to be_an_instance_of(Paysafe::CustomerVaultService)
  end

  it 'should have a Direct Debit Service' do
    expect(api_client.direct_debit_service)
      .to be_an_instance_of(Paysafe::DirectDebitService)
  end

  it 'should have a 3D Secure Service' do
    expect(api_client.three_d_secure_service)
      .to be_an_instance_of(Paysafe::ThreeDSecureService)
  end

  it 'should send GET HTTP requests' do
    request = Paysafe::Request.new(method: 'GET', uri: '/paymenthub/v1/monitor')

    expect(api_client.process_request(request)).to include(:status)
  end
end
