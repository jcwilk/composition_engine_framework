require 'cgi'

module CompositionEngineApi
  class Middleware
    attr_accessor :app, :env

    def initialize(_app)
      self.app = _app
    end

    def call(_env)
      self.env = _env
      call_override || app.call(_env)
    end

    def call_override
      [200,{'Content-Type' => 'text/plain'},[CGI.escape_html(env.inspect)]]
    end

    class LoginManager

    end
  end
end