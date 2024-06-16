import argparse
from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello World!")

def main():
    parser = argparse.ArgumentParser(description='HTTP Server arguments')
    parser.add_argument('--port', type=int, default=8080, help='Port')
    parser.add_argument('--host', type=str, default='0.0.0.0', help='Host')
    args = parser.parse_args()
    server_address = (args.host, args.port)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    httpd.serve_forever()

if __name__ == "__main__":
    main()
