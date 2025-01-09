echo --------------
echo HEALTHCHECK 01
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000; echo -e 'GET /health/ready HTTP/1.1\r\nHost: localhost:9000\r\nConnection: close\r\n\r\n' >&3;cat <&3 | grep -q '\"status\": \"UP\"' && echo exit 0 || echo exit 1
echo --------------
echo HEALTHCHECK 02
echo --------------
[ -f /tmp/HealthCheck.java ] || echo "public class HealthCheck { public static void main(String[] args) throws java.lang.Throwable { System.exit(java.net.HttpURLConnection.HTTP_OK == ((java.net.HttpURLConnection)new java.net.URL(args[0]).openConnection()).getResponseCode() ? 0 : 1); } }" > /tmp/HealthCheck.java && java /tmp/HealthCheck.java http://localhost:9000/health/live
echo --------------
echo HEALTHCHECK 03
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000;echo -e \"GET /health/ready HTTP/1.1\r\nhost: http://localhost\r\nConnection: close\r\n\r\n\" >&3;grep \"HTTP/1.1 200 OK\" <&3
echo --------------
echo HEALTHCHECK 04
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000;echo -e 'GET /health/ready HTTP/1.1\r\nhost: http://localhost\r\nConnection: close\r\n\r\n' >&3;if [ $? -eq 0 ]; then echo 'Healthcheck Successful';echo exit 0;else echo 'Healthcheck Failed';echo exit 1;fi;
echo --------------
echo HEALTHCHECK 05
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000;echo -e 'GET /health/ready HTTP/1.1\r\nhost: http://localhost\r\nConnection: close\r\n\r\n' >&3;if [ $? -eq 0 ]; then echo 'Healthcheck Successful';echo exit 0;else echo 'Healthcheck Failed';echo exit 1;fi;
echo --------------
echo HEALTHCHECK 06
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000; echo -e 'GET /health/ready HTTP/1.1\r\nHost: localhost:9000\r\nConnection: close\r\n\r\n' >&3;cat <&3 | grep -q '\"status\": \"UP\"'
echo --------------
echo HEALTHCHECK 07
echo --------------
exec 3<>/dev/tcp/127.0.0.1/9000;echo -e 'GET /health/ready HTTP/1.1\r\nhost: http://localhost\r\nConnection: close\r\n\r\n' >&3;if [ $? -eq 0 ]; then echo 'Healthcheck Successful';echo exit 0;else echo 'Healthcheck Failed';echo exit 1;fi;
