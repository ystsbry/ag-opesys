export class DurableObject {
  async fetch(_request: unknown): Promise<Response> {
    return new Response("mock");
  }
}
