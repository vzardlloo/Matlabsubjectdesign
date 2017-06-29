function b = is_onep(c)
	% is hand a pair?
	
	cn = findv(c); % get values of cards
	
	% if there are four different elements in the hand
	if length(unique(cn)) == 4
		
		b = 1;
		
	else
		
		b = 0;
		
	end
	
	
end