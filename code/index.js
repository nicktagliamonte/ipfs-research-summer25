import { createHelia } from "helia";
import { unixfs } from "@helia/unixfs";
import { fromString } from "uint8arrays/from-string";

async function main() {
  const helia = await createHelia();
  const fs = unixfs(helia);

  const cid = await fs.addBytes(fromString("Hello from Helia!"));
  console.log("CID:", cid.toString());

  const block = await helia.blockstore.get(cid);
  console.log("Block:", block);

  if (block) {
    // block is usually a Uint8Array or has the bytes under one of these keys
    const bytes =
      block.bytes || block.block || block.data || block.value || block;
    console.log("Data:", Buffer.from(bytes).toString("utf8"));
  }
}

main();
