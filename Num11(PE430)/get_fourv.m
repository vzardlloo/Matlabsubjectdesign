function v = get_fourv(C)
	% get value of four of a kind hand
	
	cn = findv(C); % get value of cards
	
	a = unique(cn);
	
	if length(a) == 1
		
		v = a; % if it is five of a kind, the value is the unique element
		
		return
		
	end
	
	% the next if/else's check which element is repeated, and puts is as
	% the value variable
	if cn(1) == cn(2)
		
		v = cn(1);
		
	elseif cn(2) == cn(3)
		
		v = cn(2);
		
	else
		
		v = cn(1);
		
	end
	
	
end
	
	