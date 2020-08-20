module Mutators
  class Base < ApplicationService
    def initialize(record, params)
      @record = define_record(record)
      @params = params
    end

    protected

    attr_reader :params, :record

    def define_record(record)
      return record if record.is_a?(model)

      model.find(record)
    end
  end
end
