module Router
  class Dispatcher
    def self.routes
      @routes ||= {}
    end

    def self.register_route( resource_name, nodule )
      routes[resource_name] = nodule
    end

    def self.dispatch( resource_name, action )
      routes[resource_name].send( action )
    end
  end
end
