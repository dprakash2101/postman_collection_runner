const core = require('@actions/core');
const exec = require('@actions/exec');

async function run() {
  try {
    const collection = core.getInput('collection');
    const environment = core.getInput('environment');
    const reportFile = core.getInput('report-file');
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

    await exec.exec('newman', newmanArgs);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
