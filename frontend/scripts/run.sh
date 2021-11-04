git pull

cd frontend

if test -f .server
then
  echo 'restart server update'
  npm run build
  pm2 delete -s next || :
  pm2 start --name next scripts/next.run.js
  # pm2 start npm -- start --name "next"
  # mkdir test
fi
