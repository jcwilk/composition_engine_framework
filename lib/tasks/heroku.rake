namespace :heroku do
  desc 'create your app on heroku'
  task :create do
    ensure_logged_into_heroku
    puts run_command_safe(Escape.shell_command(['heroku','create',app_name,'--stack','cedar']))
  end

  desc 'push your branch to heroku master'
  task :push do
    ensure_logged_into_heroku
    ensure_git_configured_for_heroku
    output = `#{Escape.shell_command(['git','push','heroku','master'])}`
    if !output.scan(/Permission denied (publickey)\./).empty?
      raise <<ERROR
Heroku permission denied, publickey failed to authenticate.
Try running 'rake heroku:add_publickey'
ERROR
    else
      puts output
    end
  end

  desc 'add your publickey to heroku'
  task :add_publickey do
    puts `heroku keys:add ~/.ssh/id_rsa.pub`
  end

  def ensure_logged_into_heroku
    if !`heroku info < /dev/null`.scan(/Enter your Heroku credentials\./).empty?
      raise <<ERROR
You are not logged into heroku.
Please run 'heroku login'
ERROR
    end
  end

  def ensure_git_configured_for_heroku
    if `git config -l`.split.grep(/^remote\.heroku\.url=git@heroku\.com/).empty?
      raise <<ERROR
Git remote 'heroku' does not exist, please add heroku as a git remote.
This should be created automatically when you create your app.
ERROR
    end
  end

  def app_name
    safe_config[:name]
  end

  def safe_config #the config with a couple checks and basic caching
    @_config||= begin
      path = File.join(File.expand_path(File.dirname(__FILE__)),'../../config/app.yaml')
      if !File.exist?(path)
        raise "Path #{path.inspect} is missing, please check out the config/app.example.yaml"
      else
        YAML.load_file(path)
      end
    end
  end

  def run_command_safe(command)
    puts "Running: #{command.inspect}"
    out = `#{command}`
    raise "Command: #{command.inspect} failed! The output was: #{out.inspect}" if $?.exitstatus != 0
    return out
  end
end