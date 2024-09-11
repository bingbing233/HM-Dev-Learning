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

// 发起一个完整的http请求 简单封装一下
export function httpRequestTest<T>(
  url: string,
  param:string = "",
  method: string = http.RequestMethod.GET,
  onSuc: (data: T) => void = (data) => {},
  onError: () => void = () => {}
) {

  // 创建一个httpRequest
  let httpRequest = http.createHttp()
  httpRequest.request(url, {
    method: http.RequestMethod.POST, // 设置请求方法
    header: {
      'Content-Type': 'application/json' // 添加header
    },
    readTimeout: 15000, // 超时
    connectTimeout: 15000, // 超时
    extraData: "", // 发送请求的额外数据
  }, (error, data) => {
    if (error.code != 200) {
      onError()
    } else {
      let obj: T = JSON.parse(data.result.toString())
      onSuc(obj)
    }
  })
}