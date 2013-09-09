require 'rocks'

$LOAD_PATH << File.join(File.dirname(__FILE__),
																		"..", "app",
																		"controllers")
module BestQuotes
	class Application < Rocks::Application
	end	
end