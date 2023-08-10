import { Request, Response } from "express";
import { deckService } from "./deck.service";

export class DeckController {
  shuffleDeck = (req: Request, res: Response) => {
    console.log(req.body);
    const deck = deckService.getDeck();
    console.log("\nBaraja:", deck.toString());
    const shuffledDeck = deck.shuffle().toString();
    console.log("\nBaraja barajada: ", shuffledDeck);
    const randomCard = deck.getRandomCard();
    console.log("\nCarta aleatoria: ", randomCard);
    return res.send("Shuffling deck...");
  };
}

export const deckController = new DeckController();
