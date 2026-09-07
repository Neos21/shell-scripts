#!/usr/bin/env node

// ================================================================================
// Check Magic Packet
// ================================================================================

const dgram = require('node:dgram');

/** 待機する UDP ポート番号 */
const port = 9;

const server = dgram.createSocket('udp4');

server.on('message', (message, remoteInfo) => {
  // マジックパケットを検証する（102バイト以上かつ先頭6バイトが FF）
  if(message.length >= 102 && message.slice(0, 6).equals(Buffer.alloc(6, 0xff))) {
    // MACアドレスを抽出してフォーマットする
    const mac = [];
    for(let i = 6; i < 12; i++) mac.push(message[i].toString(16).toUpperCase().padStart(2, '0'));
    
    const jstNow = new Date(Date.now() + ((new Date().getTimezoneOffset() + (9 * 60)) * 60 * 1000));
    const year    = jstNow.getFullYear();
    const month   = String(jstNow.getMonth() + 1).padStart(2, '0');
    const date    = String(jstNow.getDate()     ).padStart(2, '0');
    const hours   = String(jstNow.getHours()    ).padStart(2, '0');
    const minutes = String(jstNow.getMinutes()  ).padStart(2, '0');
    const seconds = String(jstNow.getSeconds()  ).padStart(2, '0');
    const timeStamp = `${year}-${month}-${date} ${hours}:${minutes}:${seconds}`;
    
    console.log(`[${timeStamp}] マジックパケットを受信しました！`);
    console.log(`  送信元 IP : ${remoteInfo.address}:${remoteInfo.port}`);
    console.log(`  対象 MAC  : ${mac.join(':')}`);
  }
});

server.on('listening', () => {
  console.log(`ポート ${port} で WOL マジックパケットの待機を開始しました (Ctrl+C で終了)`);
});

server.bind(port);
