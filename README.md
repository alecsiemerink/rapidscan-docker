## Usage

To run RapidScan inside a Docker container, use the following command:

```bash
docker run -t --rm --name rapidscan -v $(pwd):/app alecsiemerink/rapidscan $DOMAIN && docker cp rapidscan:/app/RS-Vulnerability-Report $(pwd)/$OUTPUT_FILE
```
Replace $DOMAIN with the target domain or IP address you want to scan, and $OUTPUT_FILE with the desired name of the vulnerability report.

This command mounts the current working directory ($(pwd)) to the /app directory inside the container, allowing the vulnerability report to be copied back to the host after the scan is complete.

## Example

Here's an example command to scan the example.com domain and save the report to a file named example_report.html:

```bash

docker run -t --rm --name rapidscan -v $(pwd):/app alecsiemerink/rapidscan example.com && docker cp rapidscan:/app/RS-Vulnerability-Report $(pwd)/example_report.html
```
## Note

Please note that RapidScan is a powerful tool that can potentially cause harm if used improperly. Use this Docker image at your own risk and make sure you have permission to scan the target before running the command.