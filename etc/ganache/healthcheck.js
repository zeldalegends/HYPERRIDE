// =============== //
//  Fetch version  //
// =============== //

// https://docs.chainstack.com/reference/ethereum-getblocknumber
  
  fetch('http://localhost:7545', {
    method: 'POST',
    headers: {accept: 'application/json', 'content-type': 'application/json'},
    body: JSON.stringify({id: 1, jsonrpc: '2.0', method: 'eth_blockNumber'})
  })
  .then(response => response.json())
  .then(response => console.log(response))
  .catch(err => console.error(err));

// ================= //
//  Vanilla version  //
// ================= //
 
// https://nodejs.org/api/http.html#httprequesturl-options-callback

const http = require('http');

const data = JSON.stringify({
    jsonrpc: '2.0',
    method: 'eth_blockNumber',
    params: [],
    id: 1
});

const options = {
    hostname: 'localhost',
    port: 7545,
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(data)
    }
};

const req = http.request(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);
    console.log(`HEADERS: ${JSON.stringify(res.headers)}`);
    res.setEncoding('utf8');
    res.on('data', (chunk) => {
        console.log(`BODY: ${chunk}`);
        process.exit(0);
    });
    res.on('end', () => {
        console.log('No more data in response.');
    });
    //if (res.statusCode =! 200) {
    //    process.exit(1);
    //}
});

req.on('error', (e) => {
    console.error(`problem with request: ${e.message}`);
    process.exit(1);
});

// Write data to request body
req.write(data);
req.end();

// =========== //
//  REFERENCE  //
// =========== //

// https://ethereum.org/developers/docs/apis/json-rpc#eth_blocknumber
