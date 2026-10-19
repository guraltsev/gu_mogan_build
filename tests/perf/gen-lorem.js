// Usage: node gen-lorem.js <paragraphs> <out.tmu>
// Deterministic lorem-ipsum document (seeded LCG): paragraph lengths 30-130 words, about every 400th
// paragraph a section heading. Plain text only, so it exercises the line breaker and hyphenation.
const fs = require("fs");
const n = parseInt(process.argv[2] || "89000", 10);
const out = process.argv[3] || "lorem.tmu";
const words = ("lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore " +
  "et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea " +
  "commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla " +
  "pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est " +
  "laborum sollicitudin tellus pellentesque habitant morbi tristique senectus netus malesuada fames turpis egestas " +
  "interdum consectetur libero vestibulum ante ipsum primis faucibus orci luctus ultrices posuere cubilia curae " +
  "internationalization incomprehensibilities characteristically counterrevolutionary electroencephalographic " +
  "uncharacteristically straightforwardness").split(" ");
let s = 12345;
const rnd = () => (s = (s * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff;
const BS = String.fromCharCode(92); // written this way because shell tools eat backslashes
const parts = ["<TMU|<tuple|1.1.0|2026.3.0>>\n\n<style|<tuple|generic>>\n\n<" + BS + "body>\n"];
for (let i = 0; i < n; i++) {
  if (i % 400 === 0) parts.push(`  <section|Section ${i / 400 + 1}>\n\n`);
  const len = 30 + Math.floor(rnd() * 100);
  const w = [];
  for (let j = 0; j < len; j++) w.push(words[Math.floor(rnd() * words.length)]);
  let t = w.join(" ");
  t = t[0].toUpperCase() + t.slice(1) + ".";
  parts.push("  " + t + "\n\n");
}
parts.push("</body>\n");
fs.writeFileSync(out, parts.join(""));
