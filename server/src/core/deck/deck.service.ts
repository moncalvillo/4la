import { Deck } from "./deck.model";

class DeckService {
  getDeck(): Deck {
    const deck = new Deck();
    return deck;
  }
}

export const deckService = new DeckService();
