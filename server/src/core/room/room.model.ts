import { RoomState, Score, Teams } from "../../shared/types";
import { Team } from "../team/team.model";

export interface IRoom {
  id: string;
  roomState?: RoomState;
  turn?: number;
  teams?: Teams;
  score?: Score;
}

export class Room implements IRoom {
  id: string;
  roomState: RoomState = RoomState.WAITING;
  turn: number = 0;
  teams: Teams = { A: new Team(), B: new Team() };
  score: Score = { A: 0, B: 0 };

  constructor(data: IRoom | string) {
    if (typeof data === "string") {
      // Si se pasa una cadena, asumimos que es un ID
      this.id = data;
    } else {
      // Si se pasa un objeto, lo usamos para inicializar
      this.id = data.id;
      this.roomState = data.roomState || this.roomState;
      this.turn = data.turn || this.turn;
      this.teams = data.teams || this.teams;
      this.score = data.score || this.score;
    }
  }
}
