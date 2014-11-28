@echo on
setlocal
SET PATH=C:\Ruby200\bin;%PATH%
rails s puma -e production -p 3000