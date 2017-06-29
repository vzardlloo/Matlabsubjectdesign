function b = is_straight(c)
	% is hand a straight?
	
	cn = sort(findv(c));
	
	b = 0;
	
	% checks if card values are consecutive
	if length(unique(diff(cn))) == 1 && min(diff(cn)) == 1
		
		b = 1;
		
	end
	
end