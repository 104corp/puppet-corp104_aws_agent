require 'spec_helper'
describe 'aws_agent' do
  context 'with default values for all parameters' do
    it { should contain_class('aws_agent') }
  end
end
