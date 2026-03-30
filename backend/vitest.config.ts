import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    environment: "node",
    alias: {
      "cloudflare:workers": new URL("./src/__mocks__/cloudflare-workers.ts", import.meta.url)
        .pathname,
    },
  },
});
