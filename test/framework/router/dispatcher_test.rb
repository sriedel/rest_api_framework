require 'test_helper'
require 'minitest/autorun'

class Router::DispatcherTest < Minitest::Spec
  describe '.register_route' do
    let(:resource) { "my resource" }
    let(:mod) { Module.new }

    it 'stores the given module under the resource name and action' do
      Router::Dispatcher.routes.must_be_empty
      Router::Dispatcher.register_route( resource, mod )
      Router::Dispatcher.routes[resource].must_equal( mod )
    end
  end

  describe '.dispatch' do
    describe 'when the resource name is known' do
      let(:resource) { "my resource" }
      let(:action) { :action }
      let(:mod) do
        Module.new do
          def self.action
            "my action response"
          end
        end
      end

      before(:each) do
        Router::Dispatcher.register_route( resource, mod ) 
      end

      it 'invokes the action method in the stored module' do
        Router::Dispatcher.dispatch( resource, action ).must_equal( "my action response" )
      end
    end
  end
end
