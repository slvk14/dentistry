# frozen_string_literal: true

class UserBlueprint < ApplicationBlueprint
  identifier :id

  fields :first_name, :last_name, :email, :age, :type, :description
end
