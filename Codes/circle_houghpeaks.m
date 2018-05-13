function peaks = circle_houghpeaks(h, radii, varargin)

params = checkargs(h, radii, varargin{:});


if params.smoothxy > 0
    [m, hsize] = gaussmask1d(params.smoothxy);
   
    h = cat(1, h(hsize:-1:1,:,:), h, h(end:-1:end-hsize+1,:,:));
    h = convn(h, reshape(m, length(m), 1, 1), 'valid');
    
    h = cat(2, h(:,hsize:-1:1,:), h, h(:,end:-1:end-hsize+1,:));
    h = convn(h, reshape(m, 1, length(m), 1), 'valid');
end

if params.smoothr > 0
    [m, hsize] = gaussmask1d(params.smoothr);
    h = cat(3, h(:,:,hsize:-1:1), h, h(:,:,end:-1:end-hsize+1));
    h = convn(h, reshape(m, 1, 1, length(m)), 'valid');
end


if isempty(params.threshold)
    params.threshold = 0.5 * max(h(:));
end

if isempty(params.nhoodxy) && isempty(params.nhoodr)
   
    maxarr = imregionalmax(h);
    
    maxarr = maxarr & h >= params.threshold;
    
  
    peakind = find(maxarr);
    [y, x, rind] = ind2sub(size(h), peakind);
    peaks = [x'; y'; radii(rind)];
    

    if ~isempty(params.npeaks) && params.npeaks < size(peaks,2)
        [~, ind] = sort(h(peakind), 'descend');
        ind = ind(1:params.npeaks);
        peaks = peaks(:, ind);
    end
    
else

    if isempty(params.nhoodxy)
        params.nhoodxy = 1;
    elseif isempty(params.nhoodr)
        params.nhoodr = 1;
    end
    nhood2 = ([params.nhoodxy params.nhoodxy params.nhoodr]-1) / 2;
    
    if isempty(params.npeaks)
        maxpks = 0;
        peaks = zeros(3, round(numel(h)/100)); 
    else
        maxpks = params.npeaks;  
        peaks = zeros(3, maxpks);
    end
    
    np = 0;
    while true
        [r, c, k, v] = max3(h);
     
        if v < params.threshold || v == 0
            break;
        end
        np = np + 1;
        peaks(:, np) = [c; r; radii(k)];
      
        if np == maxpks
            break;
        end
     
        r0 = max([1 1 1], [r c k]-nhood2);
        r1 = min(size(h), [r c k]+nhood2);
        h(r0(1):r1(1), r0(2):r1(2), r0(3):r1(3)) = 0;
    end 
    peaks(:, np+1:end) = [];   % trim
end


if params.margin > 0
    peaks([1 2], :) = peaks([1 2], :) - params.margin;
end
end

function params = checkargs(h, radii, varargin)

ip = inputParser;


htest = @(h) validateattributes(h, {'double'}, {'real' 'nonnegative' 'nonsparse'});
ip.addRequired('h', htest);
rtest = @(radii) validateattributes(radii, {'double'}, {'real' 'positive' 'vector'});
ip.addRequired('radii', rtest);


mtest = @(n) validateattributes(n, {'double'}, {'real' 'nonnegative' 'integer' 'scalar'});
ip.addOptional('margin', 0, mtest); 


stest = @(s) validateattributes(s, {'double'}, {'real' 'nonnegative' 'scalar'});
ip.addParamValue('smoothxy', 0, stest);
ip.addParamValue('smoothr', 0, stest);
ip.addParamValue('threshold', [], stest);
nptest = @(n) validateattributes(n, {'double'}, {'real' 'positive' 'integer' 'scalar'});
ip.addParamValue('npeaks', [], nptest);
nhtest = @(n) validateattributes(n, {'double'}, {'odd' 'positive' 'scalar'});
ip.addParamValue('nhoodxy', [], nhtest);
ip.addParamValue('nhoodr', [], nhtest);
ip.parse(h, radii, varargin{:});
params = ip.Results;
end

function [m, hsize] = gaussmask1d(sigma)

hsize = ceil(2.5*sigma);  
x = (-hsize:hsize) / (sqrt(2) * sigma);
m = exp(-x.^2);
m = m / sum(m);  
end

function [r, c, k, v] = max3(h)

[vr, r] = max(h);
[vc, c] = max(vr);
[v, k] = max(vc);
c = c(1, 1, k);
r = r(1, c, k);
end