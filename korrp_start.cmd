@echo on
setlocal
SET PATH=C:\Ruby200\bin;%PATH%
SET PATH=C:\Ruby200\oracle10;%PATH%
rails s puma -e production -p 3000