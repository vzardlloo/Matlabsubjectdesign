function v = get_onepv(c)
	% get value of one pair hand
	
	cn = findv(c);
	
	a = unique(cn);
	
	% loop through cards
	for k = 1:4
		
		% see which card is repeated
		if sum(ismember(cn,a(k))) == 2
			
			% hand value is said card value
			v = a(k);
			
		end
		
	end	
	
end