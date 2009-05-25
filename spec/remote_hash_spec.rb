require File.dirname(__FILE__) + '/spec_helper.rb'


describe "RemoteHash" do
  before(:all) do
    PocketWatch::Server.run({})
  end
  after(:all) do
    PocketWatch::Server.shutdown
  end
end