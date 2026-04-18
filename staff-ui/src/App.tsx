import { createQuery, gql } from "@urql/solid";

const HELLO_QUERY = gql`
  query Hello {
    hello
  }
`;

export default function App() {
  const hello = createQuery<{ hello: string }>({ query: HELLO_QUERY });

  return (
    <main>
      <h1>Hello from Staff UI</h1>
      <p>
        {hello.fetching
          ? "Loading..."
          : hello.error
            ? `Error: ${hello.error.message}`
            : hello.data?.hello}
      </p>
    </main>
  );
}
