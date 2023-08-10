import { Socket } from "socket.io";
import { socketService } from "./socket.service";

export default class SocketController {
  handleConnection(socket: Socket) {
    socket.emit("connection", null);

    // For more events, e.g.,
    socket.on("joinRoom", (data) => this.handleJoinRoom(data));
    socket.on("shuffleDeck", () => this.handleShuffleDeck());
  }

  handleJoinRoom(data: any): void {
    socketService.joinRoom(data);
  }

  handleShuffleDeck(): void {
    socketService.shuffleDeck();
  }
}
