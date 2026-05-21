#web-development/framework
# App router

[[CORS#CORS handling in Next.js API routes]]

### documentation

create APIs: https://nextjs.org/docs/app/getting-started/route-handlers

### default caching on server-components

- pages get pre-rendered during build, so if you put you are calling `new Date()` in component, the date remains same (equal to time at which build happened)
- this default behaviour (caching behavior) is called as static rendering
- to opt out, activate dynamic rendering

### dynamic rendering

- get some data from the incoming request and dynamic rendering will be activated

```ts
import { cookies } from "next/headers";
export default function Page() {
  cookies(); // this line will activate dynamic-rendering as we are reading cookies from incoming request
}
```

### dynamic imports or lazy loading

Next.js provides the next/dynamic function, which is a wrapper around React's lazy() and Suspense.
This function works seamlessly in both the App Router and the Pages Router.

```tsx
// sometimes if we import dynamic-component from node_module directly, we get module-not-found error
// in this case, import componet from node_module in separate file and import component dynamically from that file

// MyDocument.tsx
import { PDFDownloadLink } from "@react-pdf/renderer";
export { PDFDownloadLink };

// page.tsx
'use client'
import dynamic from "next/dynamic";
const PDFDownloadLink = dynamic(
  () => import("./MyDocument").then((mod) => mod.PDFDownloadLink),
  {
    ssr: false,
    loading: () => <p>Loading document...</p>,
  },
);
```

### route handlers

- Route handlers are functions that are executed when a user accesses a specific route on a website


#errors 

### next-server is consuming lot more RAM and CPU than expected
- remove `.next` directory (worked for `next app router v16.1.6` on March-2026)


---

## errors
### `unhandledRejection: ReferenceError: indexedDB is not define at ignore-listed frames`

- `indexedDB` is part of browser, but somehow it is getting executed on server-side
- if this is happening due to project's component, make that component client component with `"use client"` on top of the file
- if this is happening due to some node_module, then import that component inside client component dynamically with server-side rendering disabled as given below :

```tsx
// providers-wrap.tsx
"use client";
import dynamic from "next/dynamic";
import { ReactNode } from "react";
const Providers = dynamic(
  () => import("./providers").then((mod) => mod.Providers),
  { ssr: false }
);

export default function ProvidersWrap({ children }: { children: ReactNode }) {
  return <Providers>{children}</Providers>;
}
```

```tsx
// providers.ts
// In this file multiple node_modules (e.g. WagmiProvider, RainbowKitProvider) calling indexedDB, hence we imported whole file dynamically in 'providers-wrap.tsx'
import type React from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { WagmiProvider } from "wagmi";
import { RainbowKitProvider } from "@rainbow-me/rainbowkit";
import { config } from "../lib/wagmi";

const queryClient = new QueryClient();
export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <WagmiProvider config={config}>
      <QueryClientProvider client={queryClient}>
        <RainbowKitProvider modalSize="compact">{children}</RainbowKitProvider>
      </QueryClientProvider>
    </WagmiProvider>
  );
}
```

### cookies
- https://nextjs.org/docs/app/api-reference/functions/cookies
- cookies are fundamentally a client-side storage mechanism; cookies are actually stored by the browser, not the server
- Reading cookies works in Server Components because you're accessing the cookie data that the client's browser sends to the server in the HTTP request headers.
