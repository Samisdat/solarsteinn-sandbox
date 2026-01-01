//! Hello world, Rust edition: a tour of the syntax.

use std::collections::HashMap;
use std::fmt;

/// A greeting in some language.
#[derive(Debug, Clone, PartialEq)]
pub struct Greeting<'a> {
    pub lang: &'a str,
    pub text: String,
    pub times: u32,
}

#[derive(Debug)]
enum Error {
    Empty,
    TooLong(usize),
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Error::Empty => write!(f, "empty greeting"),
            Error::TooLong(n) => write!(f, "greeting too long: {n} bytes (limit 255)"),
        }
    }
}

trait Shout {
    fn shout(&self) -> String;
}

impl Shout for Greeting<'_> {
    fn shout(&self) -> String {
        self.text.to_uppercase() + "!"
    }
}

/* block comment
   spanning lines */
fn validate(text: &str) -> Result<&str, Error> {
    match text.len() {
        0 => Err(Error::Empty),
        n if n > 0xFF => Err(Error::TooLong(n)),
        _ => Ok(text),
    }
}

const MAX: u64 = 2_000_000;
static NAME: &str = "world\t\"quoted\"\n";

fn main() {
    let mut table: HashMap<&str, Greeting> = HashMap::new();
    let raw = r#"raw "string""#;
    let bytes = b"bytes";
    let ch = 'x';
    let pi = 3.14_f64;
    for (i, lang) in ["en", "de", "fr"].iter().enumerate() {
        table.insert(lang, Greeting { lang, text: format!("hello {i}"), times: 1 });
    }
    if let Ok(t) = validate("Hello, world") {
        println!("{t} {raw} {bytes:?} {ch} {pi} {MAX} {NAME}");
    }
    let closure = |a: i32, b: i32| -> i32 { a + b };
    println!("{}", closure(1, 2));
    unsafe { /* nothing to see */ }
}
