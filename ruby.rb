def janken(inp)
	if inp == 0
		data = "グー"
	elsif inp == 1
		data = "チョキ"
	else
		data = "パー"
	end
	return data
end

def win_or_lose_j(me,enemy)
	if me + 1 == enemy || (me == 2 && enemy == 0 )
		return "you_win"
	elsif me == enemy
		return "draw"
	else
		return "you_lose"
	end		
end

class Janken
	def initialize(my_j_data,enemy_j_data)
		@me_n = my_j_data.to_i
		@en_n = enemy_j_data.to_i
		@me = janken(@me_n)
		@enemy = janken(@en_n)
	end
	
	def result_j
		puts "-------------------"
		puts "あなた：#{@me}を出しました"
		puts "相手：#{@enemy}を出しました"
		puts "-------------------"
	end
	
	def win_or_lose
		win_or_lose_result = win_or_lose_j(@me_n,@en_n)
		return win_or_lose_result
	end
end

class Attimuitehoi
	def initialize(my_a_data,enemy_a_data,win_or_lose_a)
		@me_n = my_a_data.to_i
		@en_n = enemy_a_data.to_i
		@me = attimuitehoi(@me_n)
		@enemy = attimuitehoi(@en_n)
		@wol = win_or_lose_a
	end
	
	def result_a
		puts "-------------------"
		puts "あなた：#{@me}"
		puts "相手：#{@enemy}"
		if @me == @enemy
			if @wol == "you_win"
				puts "あなたの勝ちです！"
			else
				puts "あなたの負けです！"
			end
		end
	end
end

def attimuitehoi(inp)
	if inp == 0
		data = "上"
	elsif inp == 1
		data = "下"
	elsif inp == 2
		data = "左"
	else
		data = "右"
	end
	return data
end


loop do
	puts "じゃんけん..."
	puts "0(グー)1(チョキ)2(パー)3(戦わない)"
	input_j = gets.chomp
	
	# 入力した値を判別
	case input_j
	when "0","1","2"
		puts "ホイ!"
	when "3"
		puts "じゃんけんを終了します"
		break
	else
		puts "もう一度入力してください"
		next
	end
	
	janken = Janken.new(input_j,rand(3))
	janken.result_j()
	
	j_result = janken.win_or_lose()
	
	# あいこの処理
	if j_result == "draw"
		loop do
			puts "あいこで..."
			puts "0(グー)1(チョキ)2(パー)3(戦わない)"
			input_j = gets.chomp;
			puts "ショ!"
			janken = Janken.new(input_j,rand(3))
			janken.result_j()
			j_result = janken.win_or_lose()
			if j_result = "draw"
				next
			else
				break
			end
		end
	end
	
	puts "あっち向いて〜"
	puts "0(上)1(下)2(左)3(右)"
	input_a = gets.chomp
	
	result_attimuite = Attimuitehoi.new(input_a,rand(4),j_result)
	result_attimuite.result_a
	
end

