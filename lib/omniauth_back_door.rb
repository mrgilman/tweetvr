module Omniauth
  class BackDoor
    def initialize(app)
      @app = app
    end

    def call(env)
      sign_in_through_the_back_door(env)
      @app.call(env)
    end

    private

    def sign_in_through_the_back_door(env)
      params = Rack::Utils.parse_query(env['QUERY_STRING'])
      user_id = params['as']

      if user_id.present?
        user = User.find(user_id)
        env['rack.session'][:remember_token] = user.remember_token
      end
    end
  end
end
