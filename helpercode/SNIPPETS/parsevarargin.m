%% Parse varargin

% Test for right input
minargin = 2;
maxargin = (minargin+1)*2;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

% Create variables that need to be filled
SearchString = [];
blAskUser = false;

for narg = 1:nargin
    sc = upper(varargin{narg});
    switch sc
        case {'ASKUSER'}
            blAskUser = true;
        case {'SEARCHSTRING', 'SS'}
            SearchString = varargin{narg-1};
        otherwise
            % Do nothing in the case of varargin{narg+1};
    end
end