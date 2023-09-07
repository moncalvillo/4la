import { Server as ServerIO, Socket } from "socket.io";
import http from "http";
import { socketService } from "./socket.service";

export default class WebSockets {
  private io: ServerIO;
  private currentSocket?: Socket; // Propiedad para mantener el socket actual
  private socketNicknames: { [socketId: string]: string } = {};

  constructor(httpServer: http.Server) {
    this.io = new ServerIO(httpServer);
  }

  init() {
    this.io.on("connection", (socket: Socket) => {
      this.socketNicknames[this.currentSocket!.id] = socket.handshake.query
        .nickname as string;

      this.currentSocket = socket;
      this.handleConnection();
      this.handleRoomEvents();
    });
  }

  private handleConnection() {
    if (!this.currentSocket) return;

    this.currentSocket.on("disconnect", () => {
      console.log("Client disconnected");
    });
  }

  private handleRoomEvents() {
    if (!this.currentSocket) return;

    this.currentSocket.on("joinRoom", (data) => {
      this.currentSocket!.join(data.roomId);
      socketService.joinRoom(data.roomId, data.nickname);
      console.log("Player joined room", data.roomId, data.nickname);
      this.currentSocket!.emit("playerJoined", data.nickname);
    });

    this.currentSocket.on("createRoom", (data) => {
      const roomId = socketService.createRoom(data);
      console.log("Created room with ID:", roomId);
      this.currentSocket!.emit("roomCreated", roomId);
    });
  }
}
