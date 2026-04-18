import { describe, it, expect } from "vitest";
import { render } from "solid-js/web";

import App from "../App";

describe("App", () => {
  it("renders heading", () => {
    const container = document.createElement("div");
    const dispose = render(() => <App />, container);
    expect(container.textContent).toContain("Hello from Owner UI");
    dispose();
  });
});
