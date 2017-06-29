function b = is_royalf(c)
	% is hand a royal flush?
	
	% a hand is not a royal flush until proven otherwise	
	b = 0;
	
	% a hand will only be a royal flush if:
	
	% it is of the same suit (second column of hand has only one different element)
	if length(unique(c(:,2))) == 1
		
		cn = findv(c);
		
		% and its values are all different and add up to 60
		if numel(unique(cn)) == 5 && sum(cn) == 60
			
			b = 1;
			
		end
		
	end
	
end