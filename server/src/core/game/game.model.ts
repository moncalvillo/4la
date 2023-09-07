import { Score, Teams } from "../../shared/types";
import { Card } from "../deck/deck.model";

export interface IGame {
  id: string;
  tableCards?: Card[];
  teams: Teams;
  score?: Score;
}

export class Game implements IGame {
  id: string;
  tableCards: Card[];
  teams: Teams;
  score: Score;

  constructor(data: IGame) {
    this.id = data.id;
    this.tableCards = data.tableCards || [];
    this.teams = data.teams;
    this.score = data.score || { A: 0, B: 0 };
  }
}
