require 'spec_helper'
describe 'sickbeard' do

  context 'with defaults for all parameters' do
    it { should contain_class('sickbeard') }
  end
end
