module Error
  module ErrorHandling
    extend ActiveSupport::Concern

    def self.included(klass)
      klass.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end
        rescue_from ActiveRecord::ActiveRecordError do |e|
          respond(e.error, 422, e.to_s)
        end
        rescue_from ActionController::ParameterMissing do |e|
          response(:unprocessable_entitry, 422, e.to_s)
        end
        rescue_from ActiveModel::ValidationError do |e|
          response(e.error, 422, e.to_s)
        end
        rescue_from ActionController::MethodNotAllowed do
          respond(:forbidden, 403, "current user isn't authorized for that")
        end
        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
        end
        rescue_from ActiveRecord::RecordInvalid do |e|
          respond('Update Failed', 400, e.to_s)
        end
        rescue_from ActiveRecord::AttributeAssignmentError do |e|
          respond('Invalid Resource Parameters', 400, e.to_s)
        end
        rescue_from ActionController::RoutingError do |e|
          respond('Routing Error', 404, e.to_s)
        end
        rescue_from CustomError do |e|
          respond(e.error, e.status, e.message.to_s)
        end
      end
    end

    private

    def respond(error, status, message)
      render json: { error: error, message: message, status: status }, status: status
    end
  end
end
