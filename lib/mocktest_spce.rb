require "rspec"
require "mocktest"


describe "mocky" do
  
  before do
    @mocky = Mocky.new
    @other = mock(Other)
    @other.stub(:message)
    Other.stub(:new).and_return(@other)
  end
  
  it "should receive the message call but not return it" do
    @other.should_receive(:message)
    @other.should_not_receive(:notthis)
    @mocky.calls_the_other
  end
  
  
end
