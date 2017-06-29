function v = get_twopv(c)
	% get value of a two pair hand
	
	cn = findv(c);
	
	a = unique(cn);
	
	% elementary check of which two cards form the two pairs
	if sum(ismember(cn,a(1))) == 2
		
		if sum(ismember(cn,a(2))) == 2
			
			l = [a(2);a(1)];
			
		else
			
			l = [a(1);a(3)];
			
		end
		
	else
		
		l = [a(2);a(3)];
		
	end
	
	% value of hand is maximum value of the two pairs
	v = max(l);
	
end