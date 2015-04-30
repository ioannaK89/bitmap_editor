Dir[
  File.expand_path('../errors/*_error.rb', __FILE__)
].each { |f| require f }
