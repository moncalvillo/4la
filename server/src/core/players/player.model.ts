import { Card } from "../deck/deck.model";

// type TeamType = "A" | "B";

export interface IPlayer {
  nickname: string;
  hand?: Card[];
  photoUrl?: string;
}

export class Player implements IPlayer {
  nickname: string;
  hand: Card[];
  photoUrl?: string | undefined;

  constructor(data: IPlayer) {
    this.nickname = data.nickname;
    this.hand = data.hand ?? [];
    this.photoUrl = data.photoUrl;
  }
}
