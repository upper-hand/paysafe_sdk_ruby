# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../api_client_shared_context'

RSpec.describe Paysafe::AccountManagementService do
  include_context 'uses api client'

  it 'has access to API client' do
    expect(api_client).to be_an_instance_of(Paysafe::PaysafeApiClient)
  end

end
