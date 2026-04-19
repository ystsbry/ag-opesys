import SchemaBuilder from "@pothos/core";
import ZodPlugin from "@pothos/plugin-zod";

export const builder = new SchemaBuilder<{
  Context: { audience: "staff" };
}>({
  plugins: [ZodPlugin],
});
