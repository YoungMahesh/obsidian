Allow all subdomains of domain as frontend for dev-server:
```ts
const nextConfig = {
	// allow hostname depth upto 1, only immediate subdomains
	// e.g. b.modal.host will be allowed but a.b.modal.host will not be allowed
	allowedDevOrigins: ['*.modal.host'],
	
	// allow multiple hostname depth, e.g. both b.modal.host and a.b.modal.host will be allowed
	allowedDevOrigins: ['**.modal.host'],
};

module.exports = nextConfig;
```