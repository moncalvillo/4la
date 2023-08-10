import express from "express";
import http from "http";
import cors from "cors";
import { Config } from "./Config";
import { deckController } from "../core/deck";
import { Server as ServerIO } from "socket.io";
import WebSockets from "./WebSockets";
class Server {
  private app: express.Application;
  private httpServer: http.Server;
  private io: ServerIO;
  constructor() {
    this.app = express();
    this.httpServer = http.createServer(this.app);
    this.io = new ServerIO(this.httpServer);
  }

  public async init(): Promise<void> {
    this.app.use(express.json());

    // Configuración de CORS
    this.app.use(
      cors({
        origin: ["http://localhost:3000", Config.appURL],
        credentials: true,
        methods: ["GET", "POST"], // Considera añadir otros métodos si los necesitas
      })
    );

    // Endpoints
    this.app.get("/test", deckController.shuffleDeck);

    WebSockets.init(this.io);

    // (Opcional) Middleware para manejar errores
    // this.app.use(errorHandlerMiddleware);

    const port = Config.port;

    // Iniciar el servidor HTTP
    this.httpServer.listen(port, () => {
      console.log(`🚀 Server ready at http://localhost:${port}`);
    });
  }
}

export default new Server();
