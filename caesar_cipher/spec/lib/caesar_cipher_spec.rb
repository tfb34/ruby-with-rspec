require "spec_helper"
require "./caesar_cipher2"

describe "#caesar_cipher" do
	it "takes in a string and number" do
       caesar_cipher("string",5)
	end
	it "when done" do
		value=caesar_cipher("What a string!",5)
		expect(value).to eq("Bmfy f xywnsl!")
	end
	
end

describe "#is_letter" do
  it 'when string length > 1' do
  		is_letter("hello").should be false
  end
  it 'when string is a letter' do
  	 is_letter("h").should be true
  end
  it 'when string is not a letter' do 
  	is_letter("$").should be false
  end
end

describe "#shift" do
 it "takes in a letter and number" do
 	shift("h",5)
 end
 it 'when done' do
 	value = shift("Z",5)
 	expect(value).to eq("E")
 end
end