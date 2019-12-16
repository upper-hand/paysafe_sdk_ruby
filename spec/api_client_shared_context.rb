# frozen_string_literal: true

RSpec.shared_context 'uses api client' do
  subject(:api_client) do
    Paysafe::PaysafeApiClient.new(
      ENV['PAYSAFE_USER'],
      ENV['PAYSAFE_PASSWORD'],
    )
  end
end
