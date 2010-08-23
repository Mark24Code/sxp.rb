require File.join(File.dirname(__FILE__), 'spec_helper')

describe SXP::Reader::CommonLisp do
  context "when reading empty input" do
    it "should complain" do
      lambda { read('') }.should raise_error(SXP::Reader::Error)
      lambda { read(' ') }.should raise_error(SXP::Reader::Error)
    end
  end

  context "when reading integers" do
    it "should read '123' as an integer" do
      read('123').should == 123
    end
  end

  context "when reading decimals" do
    # TODO
  end

  context "when reading ratios" do
    # TODO
  end

  context "when reading symbols" do
    it "should read 'foo' as a symbol" do
      read('foo').should == :'foo'
    end
  end

  context "when reading lists" do
    it "should read '()' as an empty array" do
      read('()').should == [] # FIXME
    end

    it "should read '(1 2 3)' as an array" do
      read('(1 2 3)').should == [1, 2, 3]
    end
  end

  context "when reading comments" do
    it "should read '() ; a comment' as a list" do
      read_all('() ; a comment').should == [[]]
    end
  end

  def read(input, options = {})
    SXP::Reader::CommonLisp.new(input, options).read
  end

  def read_all(input, options = {})
    SXP::Reader::CommonLisp.new(input, options).read_all
  end
end
