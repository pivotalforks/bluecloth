# Unit test for bugs found in BlueCloth
require 'spec/spec_helper'

describe BlueCloth, 'bugs' do

	### :TODO: Add more documents and test their transforms.

  it "regexp engine overflow" do
    pending
		contents = File::read( File::join(BaseDir,"tests/data/re-overflow.txt") )
		bcobj = BlueCloth::new( contents )

		assert_nothing_raised {
			bcobj.to_html
		}
	end
	
  it "regexp engine overflow 2" do
    pending
		contents = File::read( File::join(BaseDir,"tests/data/re-overflow2.txt") )
		bcobj = BlueCloth::new( contents )

		assert_nothing_raised {
			bcobj.to_html
		}
	end
	
  it "2 character bold asterisks" do
    pending
		html = nil
		str = BlueCloth::new( "**aa**" )
		assert_nothing_raised do
			html = str.to_html
		end

		assert_equal "<p><strong>aa</strong></p>", html
	end

  it "2 character bold underscores" do
    pending
		html = nil
		str = BlueCloth::new( "__aa__" )
		assert_nothing_raised do
			html = str.to_html
		end

		assert_equal "<p><strong>aa</strong></p>", html
	end
	
  it "should correctly emphasize two character words with asterisks" do
		BlueCloth::new("*aa*").to_html.should == "<p><em>aa</em></p>"
	end
	
  it "should correctly emphasize two character words with underscores" do
		BlueCloth::new("_aa_").to_html.should == "<p><em>aa</em></p>"
	end

	it "ruby with warnings enabled causes ArgumentError" do
    pending
		oldverbose = $VERBOSE
    begin
      assert_nothing_raised do
        $VERBOSE = true
        BlueCloth.new( "*woo*" ).to_html
      end
    ensure
      $VERBOSE = oldverbose
    end
	end
	
end
