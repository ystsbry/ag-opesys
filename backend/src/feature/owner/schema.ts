import { builder } from "./builder";

import "./queries/hello/query";
import "./commands/register-staff/mutation";
import "./commands/register-store/mutation";

builder.queryType({});
builder.mutationType({});

export const ownerSchema = builder.toSchema();
