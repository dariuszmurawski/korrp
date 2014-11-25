@echo on
setlocal
SET PATH=C:\Ruby200\bin;%PATH%
SET PATH=C:\Ruby200\ssl\bin;%PATH%
SET CPATH=C:\Ruby200\ssl\include;%CPATH%
SET LIBRARY_PATH=C:\Ruby200\ssl\lib;%LIBRARY_PATH%
rem call C:\Ruby200\devkit\devkitvars.bat 
rem call C:\Ruby200\devkit\devkit.cmd 
call gem install rails -N 
rem call bundle config build.puma --with-opt-dir=C:/Ruby200/sll/ 
call bundle install
call bundle exec rake db:drop rails_env=production
call bundle exec rake db:create rails_env=production
call bundle exec rake db:migrate rails_env=production
call bundle exec rake db:seed rails_env=production
call bundle exec rake assets:precompile rails_env=production
pause
