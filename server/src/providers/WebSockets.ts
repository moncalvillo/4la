// websockets.ts

import { Server as ServerIO, Socket } from "socket.io";

export default class WebSockets {
  private io: ServerIO;

  constructor(io: ServerIO) {
    this.io = io;
  }

  init() {
    this.io.on("connection", (socket: Socket) => {
      console.log("New client connected", socket.client);
      WebSockets.handleConnection(socket);
    });
  }

  private static handleConnection(socket: Socket) {
    socket.on("disconnect", () => {
      console.log("Client disconnected");
    });

    // You can add more event listeners for this socket here, for example:
    // socket.on("someEvent", (data) => { ... });
  }
}
