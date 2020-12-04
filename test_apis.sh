#!/bin/sh
sleep 30

ab -n 10 -c 5 http://kong:8000/coins
ab -n 10 -c 5 http://kong:8000/money
ab -n 10 -c 5 http://kong:8000/coins?ok=1
ab -n 10 -c 5 http://kong:8000/money?ok=1