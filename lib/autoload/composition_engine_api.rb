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
      if env['PATH_INFO'] =~ /^\/api(\/.*)?$/
        [200,{'Content-Type' => 'text/plain'},[self.env.keys.map{|k| "#{k.inspect}: #{self.env[k].inspect}"}.join("\n")]]
      else
        nil
      end
    end

    class LoginManager

    end
  end
end