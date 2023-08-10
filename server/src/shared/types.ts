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

export interface Card {
  suit: Suit;
  value: CardValue;
}
