import { Card } from "../deck/deck.model";
import { Player } from "../players/player.model";

interface ITeam {
  players?: Player[];
  score?: number;
  trumpCards?: Card[];
}

export class Team implements ITeam {
  players: Player[];
  score: number;
  trumpCards: Card[];

  constructor(data?: ITeam) {
    this.players = data?.players ?? [];
    this.score = data?.score ?? 0;
    this.trumpCards = data?.trumpCards ?? [];
  }
}
