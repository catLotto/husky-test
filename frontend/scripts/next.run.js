const {exec, execSync} = require("child_process");

exec("npm start", {
  windowsHide: true,
  cwd: process.cwd(),
});

client.stdout.pipe(process.stdout);
client.stderr.pipe(process.stderr);
