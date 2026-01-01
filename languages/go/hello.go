// Package main is hello world, Go edition: a tour of the syntax.
package main

import (
	"context"
	"errors"
	"fmt"
	"os"
	"strings"
	"sync"
)

const (
	Max     = 1 << 10
	Version = "1.0.0"
)

var ErrEmpty = errors.New("empty greeting")

// Greeter says hello in some way.
type Greeter interface {
	Greet(name string) (string, error)
}

type Loud struct {
	Prefix string `json:"prefix"`
	times  int
}

func (l *Loud) Greet(name string) (string, error) {
	if name == "" {
		return "", fmt.Errorf("greet: %w", ErrEmpty)
	}
	l.times++
	return strings.ToUpper(l.Prefix + name + "!"), nil
}

func Map[T, U any](xs []T, f func(T) U) []U {
	out := make([]U, 0, len(xs))
	for _, x := range xs {
		out = append(out, f(x))
	}
	return out
}

func worker(ctx context.Context, id int, ch chan<- string, wg *sync.WaitGroup) {
	defer wg.Done()
	select {
	case ch <- fmt.Sprintf("worker %d", id):
	case <-ctx.Done():
	}
}

func main() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	var wg sync.WaitGroup
	ch := make(chan string, 3)
	for i := 0; i < 3; i++ {
		wg.Add(1)
		go worker(ctx, i, ch, &wg)
	}
	wg.Wait()
	close(ch)

	var g Greeter = &Loud{Prefix: "hello, "}
	if msg, err := g.Greet("world"); err != nil {
		fmt.Fprintln(os.Stderr, err)
	} else {
		fmt.Println(msg, 'x', 3.14, `raw
string`)
	}
	fmt.Println(Map([]int{1, 2, 3}, func(i int) string { return fmt.Sprint(i * 2) }))
}
