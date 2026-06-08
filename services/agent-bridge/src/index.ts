import cors from "cors";
import express from "express";

const app = express();
const port = Number(process.env.BRIDGE_PORT || 4100);

app.use(cors());
app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({
    ok: true,
    service: "agent-bridge",
    mode: "stub",
    timestamp: new Date().toISOString()
  });
});

app.post("/dispatch", (req, res) => {
  const payload = req.body;

  res.status(202).json({
    ok: true,
    accepted: true,
    message: "Instruction queued for Codex/Cloud Code bridge.",
    payload
  });
});

app.listen(port, () => {
  console.log(`Agent bridge listening on ${port}`);
});

