require 'spec_helper'
describe 'corp104_aws_agent' do
  context 'with default values for all parameters' do
    it { should contain_class('corp104_aws_agent') }
  end
end
