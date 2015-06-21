Fabricator(:drawing) do
  image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/test_drawing.png'))) }
end