begin
  require 'resource_controller'
rescue LoadError
  puts <<-END
******************************************************
* please install giraffesoft-resource_controller gem *
******************************************************
  END
end
