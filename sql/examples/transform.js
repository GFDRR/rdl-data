const monsters = require('./monsters.json');

console.log(monsters.map(m =>
  [
    `"${m.name}"`,
    m.size,
    m.type,
    m.strength,
    m.dexterity,
    m.constitution,
    m.intelligence,
    m.wisdom,
    m.charisma
  ].join(',')
).join('\n'));
