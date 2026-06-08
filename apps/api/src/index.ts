import cors from "cors";
import express from "express";
import { agents, tasks } from "./data";

const app = express();
const port = Number(process.env.PORT || 4000);

app.use(cors());
app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({
    ok: true,
    service: "api",
    timestamp: new Date().toISOString()
  });
});

app.get("/agents", (_req, res) => {
  res.json({
    items: agents
  });
});

app.get("/tasks", (_req, res) => {
  res.json({
    items: tasks
  });
});

app.post("/tasks", (req, res) => {
  const task = {
    id: `task-${String(tasks.length + 1).padStart(3, "0")}`,
    status: "queued",
    ...req.body
  };

  tasks.unshift(task);

  res.status(201).json({
    ok: true,
    task
  });
});

app.listen(port, () => {
  console.log(`API listening on ${port}`);
});

