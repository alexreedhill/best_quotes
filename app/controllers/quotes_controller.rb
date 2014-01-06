class QuotesController < Rocks::Controller

	def index
		quotes = FileModel.all
		render :index, :quotes => quotes
	end
	
	def a_quote
		controller_name = self.class.to_s
		render :a_quote, :noun => :winking, :controller_name => controller_name
	end

	def quote_1
		quote_1 = FileModel.find(1)
		render :quote, :obj => quote_1
	end

	def new_quote
		attrs = {
			"submitter" => "web user",
			"quote" => "All those who wander are not lost",
			"attribution" => "Me!"
		}
		m = FileModel.create attrs
		render :quote, :obj => m
	end

	def exception
		raise 'Does not compute!!!'
	end
	
end