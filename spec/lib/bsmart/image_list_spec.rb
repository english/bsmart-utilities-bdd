require 'spec_helper'
require 'bsmart/image_list'

describe ImageList do
	before do
		setup_temp_dir
	end

	it "lists image names in the supplied dir" do
		in_temp_dir do
			1.upto(3) do |i| FileUtils.touch "image_#{i}.jpg" end
			FileUtils.touch 'bla.pdf'

			subject = ImageList.new
			expected = %w( image_1.jpg image_2.jpg image_3.jpg ).map { |f|
				File.expand_path f
			}
			subject.images.should =~ expected
		end
	end

	after do
		teardown_temp_dir
	end
end
