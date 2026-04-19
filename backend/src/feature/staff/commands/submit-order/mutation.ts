import { z } from "zod";
import { builder } from "../../builder";

const SubmitOrderItemInput = builder.inputType("SubmitOrderItemInput", {
  fields: (t) => ({
    menuItemId: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(100) },
    }),
    quantity: t.int({
      required: true,
      validate: { schema: z.number().int().min(1).max(100) },
    }),
  }),
});

const SubmitOrderInput = builder.inputType("SubmitOrderInput", {
  fields: (t) => ({
    tableId: t.string({
      required: true,
      validate: { schema: z.string().trim().min(1).max(100) },
    }),
    items: t.field({
      type: [SubmitOrderItemInput],
      required: true,
      validate: { schema: z.array(z.any()).min(1).max(100) },
    }),
  }),
});

builder.mutationField("submitOrder", (t) =>
  t.boolean({
    args: {
      input: t.arg({ type: SubmitOrderInput, required: true }),
    },
    resolve: () => {
      throw new Error("submitOrder is not implemented yet");
    },
  }),
);
