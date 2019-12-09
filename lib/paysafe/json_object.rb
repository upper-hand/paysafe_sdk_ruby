# frozen_string_literal: true

module Paysafe
  class JsonObject
    def initialize(args)
      args.each do |key, value|
        instance_variable_set("@#{key}".to_sym, value)
      end
    end

    def get(required = [], ignore = [])
      vars = {}

      instance_variables.map do |name|
        s = name.to_s
        s[0] = ''

        if !ignore.include?(s) && (!instance_variable_get(name).nil? || required.include?(s))
          vars[s] = instance_variable_get(name)
        end
      end

      vars
    end

    def to_snake_case
      vars = {}

      instance_variables.map do |name|
        name.to_s
          .gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase

        vars[s] = instance_variable_get(name)
      end

      vars
    end
  end
end
