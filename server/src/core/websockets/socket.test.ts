// import { createServer } from "http";
// import { Server as ServerIO, Socket } from "socket.io";
// import { Socket as SocketClient } from "socket.io-client";
// describe("my awesome project", () => {
//   let io: ServerIO;
//   let serverSocket: Socket;
//   let clientSocket: SocketClient;
//   beforeAll((done) => {
//     const httpServer = createServer();
//     io = new ServerIO(httpServer);
//     httpServer.listen(() => {
//       const port = httpServer.address().port;
//       clientSocket = new SocketClient(`http://localhost:${port}`);
//       io.on("connection", (socket) => {
//         serverSocket = socket;
//       });
//       clientSocket.on("connect", done);
//     });
//   });

//   afterAll(() => {
//     io.close();
//     clientSocket.close();
//   });

//   test("should work", (done) => {
//     clientSocket.on("hello", (arg) => {
//       expect(arg).toBe("world");
//       done();
//     });
//     serverSocket.emit("hello", "world");
//   });

//   test("should work (with ack)", (done) => {
//     serverSocket.on("hi", (cb) => {
//       cb("hola");
//     });
//     clientSocket.emit("hi", (arg) => {
//       expect(arg).toBe("hola");
//       done();
//     });
//   });
// });
