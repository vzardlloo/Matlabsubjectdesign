function b = is_fullh(C)
	% is hand a full house?
	
	b = 0;
		
	cn = findv(C);
	
	a = unique(cn);
	
	% conditions for a full house are:
	
	% two unique elements
	if length(a) ~= 2
		
		return
		
	end
	
	% the first unique element is repeated either two times or three times
	if sum(ismember(cn,cn(1))) == 2 || sum(ismember(cn,cn(1))) == 3
		
		b = 1;
		
	end
	
end