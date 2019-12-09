# frozen_string_literal: true

require 'uri'
require 'yaml'

module Paysafe
  class Request
    POST = 'POST'
    GET = 'GET'
    DELETE = 'DELETE'
    PUT = 'PUT'

    public_constant :POST
    public_constant :GET
    public_constant :DELETE
    public_constant :PUT

    # stores data for paysafe api client
    @data = nil

    attr_accessor :data

    def initialize(args)
      self.data = {
        uri: '',
        method: Request::GET,
        body: nil,
        query: {},
        url: nil,
      }

      if args.is_a?(Hash)
        args.each { |key, value| data[key.to_sym] = value }
      elsif args.is_a?(Paysafe::Link)
        data[:url] = args[:href]
      end
    end

    # Build url for the paysafe api client.
    def build_url(api_end_point)
      if @data[:url].nil?
        # rubocop:disable Lint/UriEscapeUnescape
        # TODO: fix after refactoring and testing
        return api_end_point + @data[:uri] + '?' +
               URI.encode(@data[:query].map { |k, v| "#{k}=#{v}" }.join('&'))
        # rubocop:enable Lint/UriEscapeUnescape
      end

      if @data[:url].index(api_end_point) != 0
        raise PaysafeError "Unexpected endpoint in url: #{@data[:url]} expected: #{api_end_point}"
      end

      @data[:url]
    end
  end
end
