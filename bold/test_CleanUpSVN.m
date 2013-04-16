function test_CleanUpSVN
%Clean up the test directories using svn
%
%   test_CleanUpSVN()
%
% Performs an svn revert as well as deleting all of the
%
% INPUTS
%  No inputs
%
% RETURNS
%  No returns
%
% Example: test_averagetSeries()
%
% See also MRVTEST TEST_VIEWCREATEDATATYPE
%
% Copyright Stanford team, mrVista, 2013
%
%


if isunix || ismac
    curDir = pwd;
    cd(mrvDataRootPath);
    
    system('svn revert -R .');
    system('svn status --no-ignore | grep ''^[I?]'' | cut -c 9- | while IFS= read -r f; do rm -rf "$f"; done');
    
    cd(curDir);
else
    warning('Could not revert svn to previous version. Ensure that there are no changes made.');
end

