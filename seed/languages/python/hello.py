#!/usr/bin/env python3
"""Hello world, Python edition: a tour of the syntax."""
from __future__ import annotations

import asyncio
import re
from dataclasses import dataclass, field
from typing import Iterator, Protocol

PATTERN = re.compile(r"^h(?P<rest>ello)\s+\w+$", re.IGNORECASE)
LIMIT = 1_000


class Speaker(Protocol):
    def speak(self) -> str: ...


@dataclass(frozen=True)
class Greeting:
    lang: str
    text: str
    tags: list[str] = field(default_factory=list)

    def speak(self) -> str:
        return f"{self.text.upper()}! ({self.lang!r})"


def countdown(n: int) -> Iterator[int]:
    """Yield n, n-1, ... 1."""
    while n > 0:
        yield n
        n -= 1


def timed(fn):
    def wrapper(*args, **kwargs):
        print(f"calling {fn.__name__}")
        return fn(*args, **kwargs)

    return wrapper


@timed
def greet(name: str = "world", *, loud: bool = False) -> str:
    msg = f"hello, {name}"
    return msg.upper() if loud else msg


async def main() -> None:
    items = {c: Greeting(c, t) for c, t in [("en", "hello"), ("de", "hallo")]}
    squares = [x**2 for x in countdown(5) if x % 2]
    try:
        await asyncio.sleep(0.01)
        print(greet(), items["en"].speak(), squares, 0x1F, 1e-3, None, True)
    except (KeyError, ValueError) as exc:
        raise RuntimeError("failed") from exc
    finally:
        print('done', end="\n")
    with open(__file__, encoding="utf-8") as fh:
        lines = fh.readlines()
    match len(lines):
        case 0:
            print("empty")
        case n if n > LIMIT:
            print("long")
        case _:
            print("ok")


if __name__ == "__main__":
    asyncio.run(main())
