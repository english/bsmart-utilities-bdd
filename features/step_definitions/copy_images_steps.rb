FIXTURE_DIR = '../../../fixtures'

Given /^the following images$/ do |images_table|
  in_current_dir do
    images_table.hashes.each do |images|
      images.each_value do |filename|
        source = File.expand_path "#{FIXTURE_DIR}/image.jpg", __FILE__
        FileUtils.cp source, filename
      end
    end
  end
end
