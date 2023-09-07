import { v4 } from "uuid";

class UuidService {
  public uuidv4(): string {
    return v4();
  }

  public uuidv4WithoutDashes(): string {
    return "a" + this.uuidv4().replace(/-/g, "");
  }
}

export const uuidService = new UuidService();
