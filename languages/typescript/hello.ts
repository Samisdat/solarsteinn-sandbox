/**
 * Hello world, TypeScript edition: a tour of the syntax.
 */
import { EventEmitter } from "node:events";
import type { Readable } from "node:stream";

export interface Greeting<T extends string = string> {
  readonly lang: T;
  text: string;
  times?: number;
}

type Lang = "en" | "de" | "fr";

enum Level {
  Quiet = 0,
  Loud = 1 << 1,
}

const greetings: Record<Lang, Greeting<Lang>> = {
  en: { lang: "en", text: "hello there" },
  de: { lang: "de", text: "hallo" },
  fr: { lang: "fr", text: "bonjour", times: 2 },
};

function isLang(x: unknown): x is Lang {
  return typeof x === "string" && x in greetings;
}

abstract class Speaker<T> {
  protected constructor(private readonly name: string) {}
  abstract speak(value: T): string;
}

class Loud extends Speaker<Greeting> {
  static #count = 0;

  constructor(name: string) {
    super(name);
    Loud.#count += 1;
  }

  speak({ text, times = 1 }: Greeting): string {
    return `${text.toUpperCase()}!`.repeat(times);
  }
}

// Decorators, generics and optional chaining
async function* stream(source: Readable): AsyncGenerator<string> {
  for await (const chunk of source) {
    yield String(chunk).trim() ?? "";
  }
}

const emitter = new EventEmitter();
emitter.on("hello", (who: string) => console.log(`hello, ${who}`));

const regex = /^h(?<rest>ello)\s+world$/giu;
const big = 123_456n;
const hex = 0xff_ff;

export function main(level: Level = Level.Loud): void {
  const lang: unknown = "en";
  if (isLang(lang)) {
    console.log(new Loud("me").speak(greetings[lang]), regex.test("hello world"), big, hex);
  }
  emitter.emit("hello", level satisfies Level);
}

main();
