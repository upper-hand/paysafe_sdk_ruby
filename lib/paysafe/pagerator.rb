# frozen_string_literal: true

module Paysafe
  class Pagerator < JsonObject
    attr_accessor :results, :position

    def initialize(data, client, obj)
      @client    = client
      @position  = 0
      @next_page = nil
      @obj       = obj
      @array_key = obj.get_pageable_array_key

      throw 'Pagerator key not defined' if @array_key.nil?

      parse(data)
    end

    # Return current element
    def current
      @results[@position]
    end

    # Go to next element
    def next
      @position += 1

      if !valid? && !@next_page.nil?
        request    = Request.new(method: Request::GET, url: @next_page)
        @next_page = nil
        response   = @client.process_request request

        parse response
        rewind
      end

      valid? ? current : false
    end

    # Reset position
    def rewind
      @position = 0
    end

    # Parse pagerator data
    def parse(data)
      @results = data[@array_key.to_sym]

      return unless data.key?(:links)

      data[:links].each do |link|
        @next_page = link[:href] if link[:rel] == 'next'
      end
    end
  end

  # Checks if current position is valid
  def valid?
    results.length > position
  end
end
