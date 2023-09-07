import { Team } from "../core/team/team.model";

export enum Suit {
  BASTOS = "Bastos",
  COPAS = "Copas",
  ESPADAS = "Espadas",
  OROS = "Oros",
}

export enum CardValue {
  AS = "As",
  TRES = "Tres",
  SOTA = "Sota",
  CABALLO = "Caballo",
  REY = "Rey",
}

export type Score = {
  A: number;
  B: number;
};

export type Teams = {
  A: Team;
  B: Team;
};

export enum RoomState {
  WAITING = "WAITING",
  PLAYING = "PLAYING",
  FINISHED = "FINISHED",
}
