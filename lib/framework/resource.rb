require_relative 'resource/builder'
require_relative 'resource/empty_resource'

def Resource( resource_name, options = {}, &block ) 
  resource_builder = ::Resource::Builder.new( resource_name, options )
  block.call( resource_builder )
end
