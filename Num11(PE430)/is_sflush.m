function b = is_sflush(c)
	% is hand a straight flush?
	
	b = 0;
	
	% a hand will only be a royal flush if:
	
	% it is of the same suit (second column of hand has only one different element)
	if length(unique(c(:,2))) == 1
		
		cn = sort(findv(c));
		
		% and its values are consecutive
		if length(unique(diff(cn))) == 1 && min(diff(cn)) == 1
			
			b = 1;
			
		end
		
	end
	
end