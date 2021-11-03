const {exec, execSync} = require("child_process");

const client = exec("npm start", {
  windowsHide: true,
  cwd: process.cwd(),
});

client.stdout.pipe(process.stdout);
client.stderr.pipe(process.stderr);

execSync("pm2 stop next");
