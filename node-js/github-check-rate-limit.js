#!/usr/bin/env node

// ================================================================================
// GitHub Check Rate Limit
// ================================================================================

const https = require('https');

/**
 * @type {string | undefined} GitHub Token
 * 
 * - `$ curl -s -H 'Authorization: Bearer 【Token】' https://api.github.com/users/codertocat -I | grep -i 'scope'` To Check Scopes
 * - https://docs.github.com/ja/developers/apps/building-oauth-apps/scopes-for-oauth-apps
 */
const ghToken = process.env['GH_TOKEN'];

/** @type {IncomingHttpHeaders} Base Headers */
const baseHeaders = (() => {
  const headers = {
    'User-Agent': 'Awesome-Octocat-App',  // Some UA is Required
    'Accept'    : 'application/json'      // https://docs.github.com/ja/rest/overview/media-types
  };
  if(ghToken) headers['Authorization'] = `Bearer ${ghToken}`;  // 'Bearer' or 'token'
  return headers;
})();

/**
 * Request
 * 
 * @param {string} url URL
 * @param {RequestOptions} options Request Options
 * @param {string | undefined} body Request Body
 * @return {Promise<{ res: Response; data: string; }} Response
 * @throws Request Error or Timeout
 */
const request = (url, options = {}, body) => new Promise((resolve, reject) => {
  const req = https.request(url, options, res => {  // `http://` Does Not Supported (Requires `http` Module)
    res.setEncoding('utf8');
    let data = '';
    res.on('data', chunk => { data += chunk; })
       .on('end' , ()    => { resolve({ res, data }); });
  }).on('error'  , error => { reject(error); })
    .on('timeout', ()    => { req.destroy(); reject('Request Timeout'); })
    .setTimeout(10000);
  if(body) req.write(body);
  req.end();
});

// Main
(async () => {
  try {
    const rawResponse = await request('https://api.github.com/rate_limit', { headers: baseHeaders });
    const response = JSON.parse(rawResponse.data);
    const rate = response.rate;
    if(!rate) throw new Error('The `rate` Property Does Not Exist');
    
    const limit     = String(rate.limit    );
    const used      = String(rate.used     );
    const remaining = String(rate.remaining);
    const maxLength = Math.max(limit.length, used.length, remaining.length);
    
    const reset    = rate.reset;
    const jstReset = new Date(reset * 1000 + 32400000)  // `* 1000` = Seconds To Milliseconds , `+ 32400000` = 9 Hours To Milliseconds (JST)
      .toISOString()                     // `ISO` But Gets JST
      .replace((/[TZ]/g), ' ') + 'JST';  // `YYYY-MM-DD HH:mm:SS.sss JST`
    
    console.log('\nGitHub Rate Limit :');
    console.log(`  GH Token  : ${ghToken ?? '(None)'}`);
    console.log(`  Limit     : ${limit    .padStart(maxLength)}`);
    console.log(`  Used      : ${used     .padStart(maxLength)}`);
    console.log(`  Remaining : ${remaining.padStart(maxLength)}`);
    console.log(`  Reset     : ${reset}`   );  // UTC Epoch Seconds
    console.log(`  Reset JST : ${jstReset}`);  // Readable JST
  }
  catch(error) {
    console.error('\nGitHub Rate Limit : Error :');
    console.error(error);
  }
})();
