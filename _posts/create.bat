set yyyy=%date:~,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set /p title=
copy _template.md "%yyyy%-%mm%-%dd%-%title%.md"