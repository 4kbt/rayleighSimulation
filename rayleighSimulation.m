%number of samples at each iteration
N = 1e6;

%accumulator
o = [];

for offset = 0:0.01:10

	%generate normally-distributed random data
	r = randn(N,2);

	%add the offset
	r(:,1) = r(:,1) + offset;

	%compute radii
	R = sqrt(r(:,1).^2 + r(:,2).^2);

	%Sort radii by size
	S = sort(R);

	%determine confidence intervals
	o = [o; offset S(floor(0.05*N)) S(ceil(0.95*N)) mean(R)];
end

plot(o(:,1), o(:,2), '1;95\% above this line;', o(:,1), o(:,3), '2;95\% below this line;', o(:,1), o(:,4),';mean;')
xlabel('offset (sigma)');
ylabel('limit or mean (sigma)');




save 'rayleighSimulation.dat' o
