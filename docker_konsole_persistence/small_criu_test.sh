# Terminal 1: Start a sleep process and get its PID
sleep 120 &
PID=$!

# Make a directory for the checkpoint image
mkdir -p /tmp/criu-test

# Checkpoint (freeze) the process
sudo criu dump -t $PID -D /tmp/criu-test --shell-job --leave-running

# If successful, the process should still be running
ps -p $PID

# Now kill the original process to test restore
kill $PID

# Restore the process
sudo criu restore -D /tmp/criu-test --shell-job
