module Resource
  class Builder
    attr_reader :resource_name, :module, :options

    def initialize( resource_name, options = {} )
      @resource_name = resource_name
      @options = options
      @base_path = '/'
      @module = Module.new
      @module.module_exec { include ::Resource::EmptyResource }
    end

    def show( options = {}, &block )
      @module.define_method(:show, &block)
      @module.module_exec { module_function(:show) }
    end
  end
end
