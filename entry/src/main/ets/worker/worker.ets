import worker from '@ohos.worker';

let TAG = "WORKER_SUB_THREAD"

// 相当于Android的service？

// 获取对应的 ThreadWorkerGlobalScope实例
const workerPort = worker.workerPort;

// 给ThreadWorkerGlobalScope的onMessage赋值，监听宿主线程发来的消息
workerPort.onmessage = (data) => {

  // 收到宿主线程消息
  console.log(`${TAG},workerPort.onMessage:` + JSON.stringify(data));

  // 模拟一个耗时任务
  setTimeout(() => {
    // 耗时结束后，向宿主线程发送消息
    workerPort.postMessage("Hello worker,I am sub thread.")
  }, 3000)
}

// 监听异常
workerPort.onmessageerror = (error) => {
  console.log(`${TAG},workerPort.onMessageError:` + JSON.stringify(error));
}

/**
 *  worker端代码编写完成后，需要在entry目录下的build-profile.json5文件的buildOption中添加对worker的配置，否则不起作用
 */