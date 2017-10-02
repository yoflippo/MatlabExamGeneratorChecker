%% Parse varargin
namefunction = 'readAndFindTextInFiles';

maxargin = 2*5+2;
minargin = 2;
if nargin < minargin
    error([ namefunction ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ namefunction ':Needs max ' num2str(minargin) ' arguments ']);
end

fExtension = [];
AbsPath = [];
AskUserForPath = [];
SearchString = [];
blAskUser = false;
blEdit = false;
blBreakpoint = false;
for narg = 1:nargin
    sc = upper(varargin{narg});
    switch sc
        case {'EXT'}
            fExtension = varargin{narg+1};
        case {'ABSPATH'}
            AbsPath = varargin{narg+1};
        case {'ASKUSER'}
            blAskUser = true;
        case {'SEARCHSTRING', 'SS'}
            SearchString = varargin{narg+1};
        otherwise
    end
end