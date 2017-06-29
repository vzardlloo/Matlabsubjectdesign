function h = geth(c)
	% get value of highest card in hand
	
	n = c(:,1);
	
	if sum(ismember(n,'A'))
		h = 14;
	elseif sum(ismember(n,'K'))
		h = 13;
	elseif sum(ismember(n,'Q'))
		h = 12;
	elseif sum(ismember(n,'J'))
		h = 11;
	elseif sum(ismember(n,'T'))
		h = 10;
	else
		h = max(str2num(n));
	end
	
	% h = max(findv(c));
	
end
