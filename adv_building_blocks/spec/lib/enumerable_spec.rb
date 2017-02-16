require './enumerable'

describe "#my_each" do
	let(:ary) {[1,2,3,4,5]}
    it 'calls given block once for each element in self' do
       value=[]
       ary.my_each {|e| value << e.to_s}
       expect(value).to eq(["1","2","3","4","5"])
    end
end

describe "#my_each_with_index" do
	let(:ary) {["cats","dogs","fish"]}
    it 'same as #each, but also passes index of element ' do
       h = {"cats"=>0,"dogs"=>1,"fish"=>2}
       h_got = {}
       ary.my_each_with_index {|value,i| h_got[value]=i }
       expect(h_got).to eq(h)
    end
end

describe "#my_select" do
let(:ary) {[1,2,3,4,5]}
  it 'given a block that returns a boolean value ' do
      expect(ary.my_select{|e| e.even?}).to be_a(Array)
  end
  it 'given a block that checks for even numbers' do
     expect(ary.my_select{|e| e.even?}).to eq([2,4])
  end
  it 'given no block' do
  	expect(ary.my_select).to be_a(Enumerator)
  end
end

describe "#my_all?" do
 let(:ary) {[1,2,3,4]}
  it 'no block given' do
     expect(ary.my_all?).to be false
  end
  context 'when block given' do
      it 'and block returns true for every element' do
      	expect(ary.my_all?{|e| e.is_a? Integer}).to be true
      end
      it 'and block returns false for at least one element' do 
      	expect(ary.my_all?{|e| e.odd?}).to be false
      end
      it 'and element is false' do
      	 a=[20,1,false,5,5]
      	 expect(a.my_all?{|e| e.odd?}).to be false
      end
      it 'and element is nil' do
      	a=[10,nil,4,5]
      	expect(a.my_all?{|e| e.odd?}).to be false
      end
  end
end 

describe "#my_any?" do
 context 'when no block given' do
 	it 'and collection has an element other than false/nil' do 
 		ary=[false, "Jimin",nil]
        expect(ary.my_any?).to be true
 	end
 	it 'and collection has no element other than false/nil ' do
 		ary=[false,nil,false,false]
 		expect(ary.my_any?).to be false
 	end
 	it 'and collection has no elements' do
 		expect([].my_any?).to be false
 	end
 end
 context 'when block is given' do
 	it 'block returns true for an element in collection' do
 		ary=[5,"Jin", 5,1]
 		expect(ary.my_any?{|e| e.is_a? String}).to be true
 	end
 	it 'no elements in collection' do
 		expect([].my_any?{|e| e.is_a? String}).to be false
 	end
 	it 'block returns false for every element in collection' do
 		ary=[1,5,7,9,11]
 		expect(ary.my_any?{|e| e.even?}).to be false
 	end
 	
 end

end


describe '#my_none?' do
 context 'when no block is given' do
 	it 'and no elements in collection' do
 		expect([].my_none?).to be true
 	end
 	it 'and no elements are true in collection' do
 		ary = [nil,false]
 		expect(ary.my_none?).to be true
 	end
 	it 'and an element is true in collection' do
 		ary =[nil,false,true]
 		expect(ary.my_none?).to be false
 	end
 end
 context 'when block is given' do
 	it 'and block returns false for every element in collection' do
 		ary=[5,7,1,9,11]
 		expect(ary.none?{|e| e.even?}).to be true
 	end
 	it 'and no elements in collection ' do
 		expect([].none?{|e| e.odd?}).to be true
 	end
 	it 'and block returns true for an element in collection ' do
       ary=[5,7,8,9,11] 
       expect(ary.none?{|e| e.even?}).to be false
 	end
 end

end