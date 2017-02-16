require './game'

describe Game do


	let(:game) {Game.new}

	it "can initialize a game" do
		expect(game).to be_a(Game)
	end
	it "can't change its 'board' explicitly" do
	   expect{game.board = Board.new}.to raise_error
	end
	it "3 X's across top row" do
		game.enterValue(1,"X")
		game.enterValue(2,"X")
		game.enterValue(3,"X")
		expect(game.gameOver(3,"X")).to be true
	end
	it "3 X's diagonally" do
		game.enterValue(3,"X")
		game.enterValue(5,"X")
		game.enterValue(7,"X")
		expect(game.gameOver(7,"X")).to be true
	end
	it "3 X's in middle column" do
		game.enterValue(2,"X")
		game.enterValue(5,"X")
		game.enterValue(8,"X")
		expect(game.gameOver(8,"X")).to be true
	end
	it "2 O's and 1 X in middle row" do
		game.enterValue(4,"O")
		game.enterValue(5,"O")
		game.enterValue(6,"X")
		expect(game.gameOver(5,"O")).to be false
	end
	
end