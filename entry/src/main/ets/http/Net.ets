import worker from '@ohos.worker';
import http from '@ohos.net.http';

const workerPort = worker.workerPort

// 发起一个http请求
export function httpTest() {
  let httpRequest = http.createHttp()
  httpRequest.request("https://www.baidu.com", (error, data) => {
    // todo 请求callback
    console.log(data.result.toString())
  })
}