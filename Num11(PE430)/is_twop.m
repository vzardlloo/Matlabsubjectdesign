function b = is_twop(c)
	% is hand a two pairs?
	
	b = 0;
	
	cn = findv(c);
	
	% for two pair, we have three unique elements in the hand, a pair,
	% another pair and one card
	if length(unique(cn)) == 3
		
		a = unique(cn);
		
		% checks if number of elements of the unique cards are one card,
		% one pair and one pair
		if sort([sum(ismember(cn,a(1))),sum(ismember(cn,a(3))),sum(ismember(cn,a(2)))]) == [1,2,2]
			
			b = 1;
			return
			
		end		
		
	end
	
end