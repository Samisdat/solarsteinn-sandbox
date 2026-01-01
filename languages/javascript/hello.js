'use strict';

// Hello world, JavaScript edition: a tour of the syntax.
const path = require('node:path');

/**
 * @param {string} name
 * @returns {string}
 */
function greet(name = 'world') {
  return `hello, ${name}!`;
}

class Counter {
  #count = 0;
  static instances = 0;

  constructor() {
    Counter.instances += 1;
  }

  get value() {
    return this.#count;
  }

  increment() {
    this.#count++;
    return this;
  }
}

const langs = new Map([
  ['en', 'hello'],
  ['de', 'hallo'],
]);

const pattern = /^(?<greeting>hel+o)\s(\w+)$/i;
const nested = { a: { b: { c: [1, 2, 3] } } };
const { a: { b: { c: [first, ...rest] } } } = nested;

async function load(url) {
  try {
    const res = await fetch(url);
    return await res.json();
  } catch (err) {
    console.error('failed:', err?.message ?? 'unknown');
  } finally {
    console.log('done');
  }
}

const sum = (...xs) => xs.reduce((acc, x) => acc + x, 0);
const label = sum(first, ...rest) > 5 ? 'big' : 'small';

for (const [code, text] of langs) {
  console.log(code, text, label, 0b1010, 0o17, 1e3, null, undefined);
}

console.log(greet(), path.basename(__filename), new Counter().increment().value);
module.exports = { greet, Counter };
