const intervalMs = 60_000;

function heartbeat() {
  console.log(
    JSON.stringify({
      ok: true,
      service: "jobs",
      timestamp: new Date().toISOString(),
      message: "Recurring checks runner alive."
    })
  );
}

heartbeat();
setInterval(heartbeat, intervalMs);

