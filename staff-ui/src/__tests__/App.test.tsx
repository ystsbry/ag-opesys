import { describe, it, expect } from "vitest";
import { render } from "solid-js/web";
import { Provider } from "@urql/solid";
import { createClient, fetchExchange } from "@urql/core";

import App from "../App";

describe("App", () => {
  it("renders heading", () => {
    const client = createClient({
      url: "http://localhost/graphql-stub",
      exchanges: [fetchExchange],
    });
    const container = document.createElement("div");
    const dispose = render(
      () => (
        <Provider value={client}>
          <App />
        </Provider>
      ),
      container,
    );
    expect(container.textContent).toContain("Hello from Staff UI");
    dispose();
  });
});
