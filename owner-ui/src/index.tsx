import { render } from "solid-js/web";
import { Provider } from "@urql/solid";
import App from "./App";
import { urqlClient } from "./graphql/client";

render(
  () => (
    <Provider value={urqlClient}>
      <App />
    </Provider>
  ),
  document.getElementById("root")!,
);
