import { DurableObject } from "cloudflare:workers";

export class MyDurableObject extends DurableObject {
  async fetch(request: Request): Promise<Response> {
    // DO のロジック
    return new Response("Hello from Durable Object");
  }
}

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const id = env.MY_DO.idFromName("default");
    const stub = env.MY_DO.get(id);
    return stub.fetch(request);
  },
};
