#!/usr/bin/env node

// ================================================================================
// GitHub Get All Repos
// ================================================================================

const fs    = require('fs/promises');
const https = require('https');
const path  = require('path');

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
 * Read Text
 * 
 * @param {string} message Prompt Message
 * @return {Promise<string>} User Input
 */
const readText = async (message = 'Please Input') => {
  process.stdout.write(`${message} > `);
  process.stdin.resume();
  let text = '';
  try {
    text = await new Promise(resolve => process.stdin.once('data', resolve));
  }
  finally {
    process.stdin.pause();
  }
  return text.toString().trim();
};

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

/**
 * Parse Link Response Header
 * 
 * @param {string} link Link Response Header
 * @return { [key: string]: string; } Links Object
 */
const parseLinkResponseHeader = link => link.split(', ').reduce((links, part) => {
  const match = part.match('<(.*?)>; rel="(.*?)"');
  // ex. 'next': https://api.github.com/user/00000000/repos?per_page=100&page=2
  if(match && match.length === 3) links[match[2]] = match[1];
  return links;
}, {});

/**
 * Get All Repositories
 * 
 * @param {string} userName User Name
 * @return {Promise<Array<*>>} Repositories
 */
const getAllRepos = async userName => {
  const allRepos = [];
  try {
    let url = `https://api.github.com/users/${userName}/repos?per_page=100&page=1`;
    while(url !== '') {
      console.log(`Request : [${url}]`);
      const { res, data } = await request(url, { headers: baseHeaders });
      
      const currentRepos = JSON.parse(data);
      if(!Array.isArray(currentRepos)) throw data;  // If `message` property exists, maybe API rate limit exceeded
      
      allRepos.push(...currentRepos);
      console.log(`  Repos : [${currentRepos.length}]`);
      
      const links = parseLinkResponseHeader(res.headers?.link);
      url = links.next ?? '';
      console.log(`  Next  : [${url || 'None'}]`);
      console.log(`  Links : [${Object.keys(links).join(', ')}]`);
    }
  }
  catch(error) {
    console.error('\nFailed To Get Repos :');
    console.error(error);
  }
  console.log(`All Repos : ${allRepos.length}`);
  return allRepos;
};

// Main
(async () => {
  try {
    const userName = process.argv[2] ? process.argv[2].trim() : 'Neos21';
    
    // Settings
    console.log('Settings :');
    console.log(`  GitHub Token : ${ghToken ?? '(None)'}`);
    console.log(`  User Name    : ${userName}`);
    
    // Confirm
    console.log('');
    if(await readText('Start?') !== 'y') return console.log('  Cancelled');
    
    // Get All Repos
    console.log('');
    const allRepos = await getAllRepos(userName);
    
    // Write File
    console.log('');
    const filePath = path.resolve(process.cwd(), `all-repos-${userName}-${new Date().toISOString()}.json`);
    if(await readText(`Write File To [${filePath}]?`) === 'y') {
      await fs.writeFile(filePath, JSON.stringify(allRepos, null, '  ') + '\n', 'utf-8');
      console.log('  File Created');
    }
    else {
      console.log('  Cancelled');
    }
    
    console.log('\nFinished!');
  }
  catch(error) {
    console.error('\nError :');
    console.error(error);
  }
})();
