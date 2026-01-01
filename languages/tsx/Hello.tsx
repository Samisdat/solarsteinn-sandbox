import { useState, type ReactNode } from "react";

interface HelloProps {
  name?: string;
  children?: ReactNode;
  onGreet?: (name: string) => void;
}

const LANGS = ["en", "de", "fr"] as const;
type Lang = (typeof LANGS)[number];

function useLang(initial: Lang = "en") {
  const [lang, setLang] = useState<Lang>(initial);
  const next = () => setLang((l) => LANGS[(LANGS.indexOf(l) + 1) % LANGS.length]);
  return [lang, next] as const;
}

export function Hello({ name = "world", children, onGreet }: HelloProps) {
  const [lang, next] = useLang();
  const text = { en: "Hello", de: "Hallo", fr: "Bonjour" }[lang];

  return (
    <section className="hello" data-lang={lang}>
      {/* a JSX comment */}
      <h1 style={{ color: "darkorange" }}>
        {text}, {name}!
      </h1>
      {children ?? <p>Nothing to add.</p>}
      <button type="button" onClick={() => { next(); onGreet?.(name); }}>
        Next language &rarr;
      </button>
      <ul>
        {LANGS.map((l) => (
          <li key={l} aria-current={l === lang}>
            {l.toUpperCase()}
          </li>
        ))}
      </ul>
    </section>
  );
}

export default Hello;
