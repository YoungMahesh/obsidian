You can publish API documentation in  using [Swagger UI docker image](https://swagger.io/docs/open-source-tools/swagger-ui/usage/installation/#docker) and [[OpenAPI]] spec

### Schema

Date (in format `YYYY-MM-DD`):
```yml
birthDate:
  type: string
  format: date
  example: "1990-05-15"
```

Date and time (RFC 3339 / ISO 8601):
```yml
createdAt:
  type: string
  format: date-time
  example: "2026-07-23T10:30:45Z"
  
# Examples:
# 2026-07-23T10:30:45Z
# 2026-07-23T10:30:45+05:30
# 2026-07-23T10:30:45.123Z
```

Bytes / base64Binary :
```yml
attachment:
  type: object
  properties:
    data:
	  type: string
	  format: byte
	  description: Base64-encoded file contents
	  example: "SGVsbG8gd29ybGQ="
```

Number / Integer:
```yml
balance:
  type: number
  # format-types: float, double
  format: float


count:
  type: integer
  # format-types: int32, int64
  format: int32
  minimum: 0
  maximum: 10000
```