function v = get_threev(c)
	% get value of three of a kind hand
	
	cn = findv(c);
	
	% loop through each of the first three hand card values
	for k = 1:3
		
		% find which card is repeated three times in the hand
		if sum(ismember(cn,cn(k))) == 3
			
			% value of hand is value of card
			v = cn(k);
			
			return
			
		end
		
	end
	
end