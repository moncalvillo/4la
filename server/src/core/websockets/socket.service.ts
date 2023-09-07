import { IRoom, Room } from "../room/room.model";
import { generateAlphanumericCode } from "../../shared/utils";
import { Player } from "../players/player.model";
import { Team } from "../team/team.model";

export const rooms: Record<string, IRoom> = {};

class SocketService {
  rooms: Record<string, IRoom> = {};

  createRoom(nickname: string): string {
    const roomId = generateAlphanumericCode(7);
    this.rooms[roomId] = new Room({
      id: roomId,
      teams: {
        A: new Team({ players: [new Player({ nickname })] }),
        B: new Team(),
      },
    });
    return roomId;
  }

  joinRoom(roomId: string, playerName: string) {
    console.log("Joining room", roomId, playerName);

    // Lógica para añadir al jugador a la sala.
    // Asegúrate de verificar si la sala existe antes de agregar al jugador.
  }

  getPlayersFromRoom(roomId: string): string[] {
    console.log("Getting players from room", roomId);
    // Retorna la lista de jugadores en la sala.
    // De nuevo, verifica que la sala exista antes de intentar acceder a ella.
    return [];
  }
}

export const socketService = new SocketService();
