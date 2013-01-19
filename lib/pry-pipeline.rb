require "pry-pipeline/version"

module PryPipeline
  if defined? Pry
    require 'pry-pipeline/response'
    require 'pry-pipeline/ext'
  end
end
