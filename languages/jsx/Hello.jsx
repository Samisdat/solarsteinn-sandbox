import React, { useEffect, useState } from 'react';
import PropTypes from 'prop-types';

export function Clock({ label }) {
  const [now, setNow] = useState(() => new Date());

  useEffect(() => {
    const id = setInterval(() => setNow(new Date()), 1000);
    return () => clearInterval(id);
  }, []);

  return (
    <time dateTime={now.toISOString()} title={label}>
      {now.toLocaleTimeString()}
    </time>
  );
}

Clock.propTypes = { label: PropTypes.string };

export function Hello({ name = 'world', items = [] }) {
  const empty = items.length === 0;

  return (
    <>
      <h1 className="title">Hello, {name}!</h1>
      {empty ? (
        <p>
          No items yet. <a href="https://example.com/?q=hello&lang=en">Learn more</a>
        </p>
      ) : (
        <ol>
          {items.map((item, i) => (
            <li key={item.id ?? i}>{item.label}</li>
          ))}
        </ol>
      )}
      <Clock label="current time" />
    </>
  );
}

Hello.propTypes = {
  name: PropTypes.string,
  items: PropTypes.arrayOf(PropTypes.shape({ id: PropTypes.number, label: PropTypes.string })),
};

export default Hello;
