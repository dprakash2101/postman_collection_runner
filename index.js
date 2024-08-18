import { getInput, setFailed } from '@actions/core';
import { exec as _exec } from '@actions/exec';

async function run() {
  try {
    const collection = getInput('collection');
    const environment = getInput('environment');
    const reportFile = getInput('report-file');
    const newmanArgs = [
      'run',
      collection,
      '--reporters',
      'cli,junit',
      '--reporter-junit-file',
      reportFile
    ];

    if (environment) {
      newmanArgs.push('--environment', environment);
    }

    await _exec('newman', newmanArgs);
  } catch (error) {
    setFailed(error.message);
  }
}

run();
