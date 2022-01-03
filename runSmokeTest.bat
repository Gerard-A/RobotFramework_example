set scriptdirectory=%~dp0
set PYTHONPATH=%scriptdirectory%resources;%PYTHONPATH%
echo %PYTHONPATH%

python -m robot --outputdir test_results --include SmokeTest tests
