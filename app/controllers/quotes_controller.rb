class QuotesController < Rocks::Controller

	def index
		quotes = FileModel.all
	end

	def a_quote
		controller_name = self.class.to_s
		render :a_quote, :noun => :winking, :controller_name => controller_name
	end

	def show
		{ :quote => FileModel.find(params["id"]), :ua => request.user_agent }
	end

	def quote_1
		quote_1 = FileModel.find(1)
		render :quote, :quote => quote_1
	end

	def new_quote
		attrs = {
			"submitter" => "web user",
			"quote" => "All those who wander are not lost",
			"attribution" => "Me!"
		}
		m = FileModel.create attrs
		render :quote, :quote => m
	end

	def update_quote
		quote = FileModel.save(env)
	end

	def submitter
		quotes = FileModel.find_all_by_submitter(env)
	end

	def attribution
		quotes = FileModel.find_all_by_attribution(env)
		render :attribution, :quotes => quotes
	end

	def exception
		raise 'Does not compute!!!'
	end

end