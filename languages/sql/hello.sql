-- Hello world, SQL edition: a tour of the syntax.
/* block comment */
CREATE TABLE IF NOT EXISTS greetings (
    id         BIGSERIAL PRIMARY KEY,
    lang       VARCHAR(8)  NOT NULL DEFAULT 'en',
    text       TEXT        NOT NULL,
    times      INTEGER     NOT NULL CHECK (times >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (lang, text)
);

CREATE INDEX idx_greetings_lang ON greetings (lang);

INSERT INTO greetings (lang, text, times)
VALUES ('en', 'Hello, world!', 1),
       ('de', 'Hallo, Welt!', 2),
       ('fr', 'Bonjour, le monde !', 3)
ON CONFLICT DO NOTHING;

WITH ranked AS (
    SELECT g.*,
           ROW_NUMBER() OVER (PARTITION BY lang ORDER BY created_at DESC) AS rn
    FROM greetings AS g
    WHERE g.times BETWEEN 1 AND 10
      AND g.text LIKE 'H%'
)
SELECT lang,
       COUNT(*)            AS total,
       SUM(times)          AS sum_times,
       AVG(times)::NUMERIC(5, 2) AS avg_times,
       CASE WHEN COUNT(*) > 1 THEN 'many' ELSE 'one' END AS bucket
FROM ranked
WHERE rn = 1
GROUP BY lang
HAVING COUNT(*) >= 1
ORDER BY total DESC, lang
LIMIT 10 OFFSET 0;

UPDATE greetings SET times = times + 1 WHERE lang IN ('en', 'de') AND id > 0;

DELETE FROM greetings WHERE created_at < NOW() - INTERVAL '30 days';

SELECT g.text, l.name
FROM greetings g
LEFT JOIN languages l ON l.code = g.lang
WHERE g.text IS NOT NULL AND NOT EXISTS (SELECT 1 FROM blocked b WHERE b.lang = g.lang);
