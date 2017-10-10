function [output] = searchInstruc(varargin)

%% Parse varargin

% Test for right input
minargin = 2;
maxargin = minargin*2;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

    SearchString = [];
    struc = [];
    
%% Create variables that need to be filled
if nargin > minargin
    for narg = 1:nargin
        sc = upper(varargin{narg});
        switch sc
            case {'struc', 'AbsolutePath'}
                struc = varargin{narg+1};
            case {'SEARCHSTRING', 'SS'}
                SearchString = varargin{narg+1};
            otherwise
                % Do nothing in the case of varargin{narg+1};
        end
    end
else
    SearchString = varargin{2};
    struc = varargin{1};  
end

%% Search in struc

%src: https://nl.mathworks.com/matlabcentral/answers/331786-how-to-search-a-field-in-a-strucure-and-extract-all-fields-that-match
output = strucfun(@(x) any(strcmp(x, SearchString)),struc);

end
