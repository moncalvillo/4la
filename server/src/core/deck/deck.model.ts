import { CardValue, Suit } from "../../shared/types";

export class Deck {
  private cards: Card[] = [];
  constructor(cards?: Card[]) {
    if (cards) {
      this.cards = cards;
    } else {
      this.cards = this.createCuatrolaDeckCards();
    }
  }

  getRandomCard(): Card {
    return this.cards[Math.floor(Math.random() * this.cards.length)];
  }

  private createCuatrolaDeckCards(): Card[] {
    const cards: Card[] = [];
    for (const suit in Suit) {
      for (const value in CardValue) {
        cards.push(
          new Card(
            Suit[suit as keyof typeof Suit],
            CardValue[value as keyof typeof CardValue]
          )
        );
      }
    }
    return cards;
  }

  // Método para barajar las cartas
  shuffle(): Deck {
    for (let i = this.cards.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [this.cards[i], this.cards[j]] = [this.cards[j], this.cards[i]]; // intercambio de elementos
    }
    return this;
  }

  drawCard(): Card | null {
    return this.cards.length > 0 ? this.cards.pop()! : null;
  }

  toString(): string {
    return this.cards.map((card) => card.toString()).join("\n ");
  }
}

export class Card {
  constructor(public palo: Suit, public valor: CardValue) {}

  toString(): string {
    return `${this.valor} de ${this.palo}`;
  }
}
