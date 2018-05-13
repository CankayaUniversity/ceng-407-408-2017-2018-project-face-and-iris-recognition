function [h, margin] = circle_hough(b, rrange, varargin)
opts = {'same' 'normalise'};
narginchk(2, 2+length(opts));
validateattributes(rrange, {'double'}, {'real' 'positive' 'vector'});
if ~all(ismember(varargin, opts))
    error('Unrecognised option');
end
[featR, featC] = find(b);
[nr, nc] = size(b);
nradii = length(rrange);
margin = ceil(max(rrange));
nrh = nr + 2*margin;        
nch = nc + 2*margin;
h = zeros(nrh*nch*nradii, 1, 'uint32'); 


tempR = []; tempC = []; tempRad = [];
for i = 1:nradii
    [tR, tC] = circlepoints(rrange(i));
    tempR = [tempR tR];
    tempC = [tempC tC];
    tempRad = [tempRad repmat(i, 1, length(tR))];
end

tempInd = uint32( tempR+margin + nrh*(tempC+margin) + nrh*nch*(tempRad-1) );
featInd = uint32( featR' + nrh*(featC-1)' );

for f = featInd
   
    incI = tempInd + f;
   
    h(incI) = h(incI) + 1;
end


h = reshape(double(h), nrh, nch, nradii);

if ismember('same', varargin)
    h = h(1+margin:end-margin, 1+margin:end-margin, :);
    margin = 0;
end

if ismember('normalise', varargin)
    h = bsxfun(@rdivide, h, reshape(rrange, 1, 1, length(rrange)));
end

end
