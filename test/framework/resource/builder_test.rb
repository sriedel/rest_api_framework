require 'test_helper'
require 'minitest/autorun'

class Resource::BuilderTest < Minitest::Spec
  let(:resource_name) { :my_resource }
  let(:builder_options) { {} }
  subject { Resource::Builder.new( resource_name, builder_options ) }

  describe 'the initializer' do
    it 'sets the resource name' do
      subject.resource_name.must_equal( resource_name )
    end

    it 'sets the options' do
      subject.options.must_equal( builder_options )
    end

    it 'sets module to a Module that included Resource::EmptyResource' do
      subject.module.must_be_kind_of( Module )
      subject.module.ancestors.must_include( ::Resource::EmptyResource )
    end
  end

  describe '#show' do
    it 'adds a show method to the module' do
      subject.show do
        "foo"
      end

      subject.module.must_respond_to( :show )
    end

    it 'creates a method in the module using the body of the show block' do
      block = lambda { "foo" }
      subject.show( &block )
      
      subject.module.show.must_equal( block.call )
    end
  end
end
