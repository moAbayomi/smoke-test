import net from "node:net";

const server = net.createServer((c) => {
  console.log("client connected");

  c.on("end", () => {
    console.log("client disconnected");
  });

  c.on("error", (err) => {
    console.log(err.message);
  })
  //c.write("hello\r\n");
  c.pipe(c);
});

server.on("error", (err) => {
  throw err;
});

server.listen(6969, "0.0.0.0", () => {
  console.log("server bound");
});
