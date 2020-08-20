module Mutators
  module Users
    class Create < Mutators::Create
      def call
        @record = specify_klass.new(@params)
        @record.save!
        send_greeting_email

        record
      end

      private

      def specify_klass
        return 'Client'.classify.constantize unless @params[:type].present?

        @params[:type].to_s.classify.constantize
      end

      def send_greeting_email
        UsersMailer.send_greeting_email(@record.email).deliver_later
      end
    end
  end
end
