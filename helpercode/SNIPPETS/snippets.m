% INSERT-SNIPPET
%   Insert a piece of code in the Matlab editor.
%
% Inspired from http://blogs.mathworks.com/community/2011/05/16/matlab-editor-api-examples/
%
% 10-May-2013, Revised 10-May-2013, Revised 23-August-2013, Revised 12-November-2014
% Comments and questions to: vincent.mazet@unistra.fr.
function snippets(snippet_file_name)

if exist('snippet'), snippet = struct('snippet',snippet); end;      % Save the variable SNIPPET, if it exists

    if isempty(strfind(snippet_file_name, '.m'))
        snipper_file_name = [snippet_file_name '.m'];
    end
    snippet.txt = fileread(snipper_file_name);
        
    snippet.txt = strrep(snippet.txt, '\n', sprintf('%c',10));          % Replace '\n' by a new line
    if verLessThan('matlab', '8.1.0')
        snippet.activeEditor = editorservices.getActive;                % Get the active document in the editor
    else
        snippet.activeEditor = matlab.desktop.editor.getActive;         % Get the active document in the editor
    end
    snippet.activeEditor.JavaEditor.insertTextAtCaret(snippet.txt);     % Insert text at the current position
    if isfield(snippet,'snippet')                                       % Delete SNIPPET (or replace it by its original value)
        snippet = snippet.snippet;
    else
        clear snippet
    end;
end