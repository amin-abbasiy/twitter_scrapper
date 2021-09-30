require 'yaml'
require 'logger'
module APP
    APP_FILE = ::YAML.load(File.read(Dir.pwd + "/config/app.yml"))
    DB_FILE = ::YAML.load(File.read(Dir.pwd + "/config/database.yml"))
    ROOT_DIR = Dir.pwd
    HOME_DIR = system("echo $HOME")
    LOGGER = Logger.new("#{ROOT_DIR}/log/develop_#{Time.now.to_s.split(" ").first.sub('-', '_')}.log", 'weekly')
    LOGGER.level = Logger::INFO
end