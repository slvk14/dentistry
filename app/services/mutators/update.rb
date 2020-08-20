module Mutators
  class Update < Mutators::Base
    def call
      record.update(params)

      record
    end

    private

    def model
      raise 'Set in child class'
    end
  end
end
