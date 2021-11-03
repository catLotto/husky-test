echo 'restart server'
if test -f .server then 
  npm run build
  pm2 start npm --name "next" -- start
fi