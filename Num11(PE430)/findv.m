function cn = findv(c)
	% find values of a hand
	
	cn = zeros(5,1);
	
	% for each of the five cards, convert the first column elements from
	% string to number, special cases apply for T - A
	for k = 1:5
		
		if strcmp(c(k,1),'A')
			cn(k) = 14;
		elseif strcmp(c(k,1),'K')
			cn(k) = 13;
		elseif strcmp(c(k,1),'Q')
			cn(k) = 12;
		elseif strcmp(c(k,1),'J')
			cn(k) = 11;
		elseif strcmp(c(k,1),'T')
			cn(k) = 10;
		else
			cn(k) = str2double(c(k,1));
		end
		
	end
	
end