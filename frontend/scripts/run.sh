pwd >> test.txt

if test -f frontend/.server
then
  echo 'restart server'
  npm run build
  #pm2 start npm --name "next" -- start
  mkdir test
fi