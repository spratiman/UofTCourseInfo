require "rubygems"
require "json"
require "open-uri"
require "uri"
require "active_record"
require_relative "../../app/models/application_record"
require_relative "../../app/models/course"
require "yaml"



dbconf = YAML.load_file(File.join(__dir__, "/../../config", "database.yml"))

ActiveRecord::Base.establish_connection(
  dbconf["development"]
)

uri = URI.parse("https://cobalt.qas.im/api/1.0/courses")
limit = 100
skip = 0
received = 100

while received >= limit do
	received = 0
	params = { :key => "8hH0mmuLdT1r1wVNBlu0ZZ8ucZ9UjT8Q", :limit => limit,  :skip => skip}

	# Add params to URI
	uri.query = URI.encode_www_form( params )

	page_content = uri.open.read
	parsed_content = JSON.parse(page_content)

	parsed_content.each do |course|
		puts course["id"]
		received += 1
		Course.update_db(course["code"], course["name"], course["description"],
        course["prerequisites"], course["exclusions"], course["breadths"])
	end
	skip += received
end
