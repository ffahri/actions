package main

import (
	"context"
	"fmt"
	"os"

	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context) (string, error) {
	return fmt.Sprintf("Hello msg: " + os.Getenv("message")), nil
}

func main() {
	lambda.Start(HandleRequest)
}
