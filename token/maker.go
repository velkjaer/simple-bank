package token

import "time"

type Maker interface {
	CreateToken(username string, duration time.Duration) (string, error)

	// VerifyToken checks is the token is valid or not
	VerifyToken(token string) (*Payload, error)
}
