class ImageList
	def initialize dir='.'
		@dir = File.expand_path dir
	end

	def images
		Dir["#{@dir}/**/*.jpg"]
	end
end
