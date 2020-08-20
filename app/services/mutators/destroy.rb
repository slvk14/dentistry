module Mutators
  class Destroy < Mutators::Base
    def call
      record.destroy

      record
    end

    private

    def model
      raise 'Set in child class'
    end
  end
end
