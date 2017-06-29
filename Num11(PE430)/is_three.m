function b = is_three(c)
	% is hand a three of a kind?
	
	cn = findv(c);
	
	b = 0;
	
	% loop through each of the first three hand card values
	for k = 1:3
		
		% if one of them is repeated three times
		if sum(ismember(cn,cn(k))) == 3
			
			b = 1;
			
			return
			
		end
		
	end
	
end