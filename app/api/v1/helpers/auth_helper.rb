module V1
  module Helpers
    module AuthHelper
      def current_user
        User.find(env['rack.session'][:user_id]) if env['rack.session'][:user_id]
      end

      def logged_in?
        error!('Unauthorized', 401) unless current_user
      end
    end
  end
end