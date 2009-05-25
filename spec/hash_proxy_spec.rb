require File.dirname(__FILE__) + '/spec_helper.rb'

describe "HashProxy" do
  describe "methods" do
    describe "save!" do
      before(:each) do
        @hp = HashProxy.new(:name => "bob")        
      end
      it "should be able to save into a marshal dump" do
        ::FileUtils.rm "/tmp/cache/.pocketwatch"
        @hp.save!
        ::Marshal.load(open("/tmp/cache/.pocketwatch").read).should == {:name => "bob"}
      end
      it "should load automatically the stored data when called again" do
        hp = HashProxy.new({:name => "matter"})
        hp[:name].should == "bob"
      end
    end
  end
end