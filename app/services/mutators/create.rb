module Mutators
  class Create < Mutators::Base
    def initialize(params, options = {})
      @params = params
      @options = options
    end

    def call
      record.save

      record
    end

    protected

    attr_reader :options

    def record
      @record ||= model.new(params)
    end

    def model
      raise 'Set in child class'
    end
  end
end
