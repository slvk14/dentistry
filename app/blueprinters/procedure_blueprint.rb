# frozen_string_literal: true

class ProcedureBlueprint < ApplicationBlueprint
  identifier :id

  fields :name, :duration_min, :price_uah
end
