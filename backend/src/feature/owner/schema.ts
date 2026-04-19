import { builder } from "./builder";

import "./queries";
import "./commands";

builder.queryType({});
builder.mutationType({});

export const ownerSchema = builder.toSchema();
