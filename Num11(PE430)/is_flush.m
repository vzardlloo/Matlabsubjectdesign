function b = is_flush(c)
	% is hand a flush?
	
	b = 0;
	
	% condition is the suit is same (only one unique element is second
	% column)
	if length(unique(c(:,2))) == 1
		
		b = 1;
		
	end
	
	
end