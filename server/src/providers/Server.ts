import express from "express";
import http from "http";
import cors from "cors";
import { Config } from "./Config";
import { deckController } from "../core/deck";
import WebSockets from "../core/websockets/socket.class";
class Server {
  private app: express.Application;
  private httpServer: http.Server;
  constructor() {
    this.app = express();
    this.httpServer = http.createServer(this.app);
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

    // Iniciar el servidor de WebSockets
    const webSockets = new WebSockets(this.httpServer);
    webSockets.init();

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
