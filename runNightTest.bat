set scriptdirectory=%~dp0
set PYTHONPATH=%scriptdirectory%resources;%PYTHONPATH%
python -m robot --outputdir test_results --include NightTest tests
