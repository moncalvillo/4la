import { uuidService } from "../../shared/uuid.service";
import { Game, IGame } from "./game.model";

export class GameService {
  createGame(data: IGame): Game {
    return new Game({
      id: uuidService.uuidv4WithoutDashes(),
      teams: data.teams,
    });
  }
}
