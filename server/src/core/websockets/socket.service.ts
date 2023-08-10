class SocketService {
  private socket: any;

  joinRoom(room: string) {
    this.socket.emit("joinRoom", room);
  }
}

export const socketService = new SocketService();
