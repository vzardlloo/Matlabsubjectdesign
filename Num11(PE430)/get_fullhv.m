function v = get_fullhv(c)
	% get value of full house hand
	
	cn = findv(c);
	
	vv = unique(cn);
	
	% we see which of the two cards is repeated three times, and assign its
	% value as the hand value
	if sum(ismember(cn,vv(1))) == 3
		
		v = vv(1);
		
	else
		
		v = vv(2);
		
	end
	
	
end