#!/usr/bin/env node

// ================================================================================
// Get FPS : Using GitBash With FFmpeg
// ================================================================================

const fs           = require('node:fs').promises;
const path         = require('node:path');
const util         = require('node:util');
const childProcess = require('node:child_process');

const execAsync = util.promisify(childProcess.exec);

const listFilePaths = (targetDirectoryPath) => fs.readdir(targetDirectoryPath, { withFileTypes: true }).then((dirents) => dirents.filter((dirent) => dirent.isFile()).map((dirent) => `${targetDirectoryPath}${path.sep}${dirent.name}`));

const convertToCygwinFilePath = (windowsFilePath) => windowsFilePath.replace((/\\/gu), '/').replace((/^([A-Z]+:)/ui), match => `/${match.toLowerCase().slice(0, -1)}`);

const execFfmpeg = async (filePath, cwd) => {
  try {
    const result = await execAsync(`ffmpeg.exe -i '${filePath}' 2>&1 | grep fps`, {
      shell: process.env.SHELL,  // Git SDK の場合 'C:/git-sdk-64/usr/bin/bash.exe' を指定することになる
      cwd  : cwd
    });
    return result;  // stdout, stderr
  }
  catch(error) {
    if(error.stderr) return { stderr: error.stderr };
    return { error: error };
  }
};

// Main
// ====================================================================================================

(async () => {
  // カレントディレクトリ
  const cwd = process.cwd();
  // カレントディレクトリ直下の動画ファイルを集める
  const rawFilePaths = await listFilePaths(cwd);
  
  for(filePath of rawFilePaths) {
    const cygwinFilePath = convertToCygwinFilePath(filePath);
    const result = await execFfmpeg(cygwinFilePath, cwd);
    if(result.stderr || result.error || !result.stdout) {
      console.error('Error : ' + result.error);
      continue;
    }
    
    console.log(filePath + ' : ' + result.stdout.trim());
  }
})();
