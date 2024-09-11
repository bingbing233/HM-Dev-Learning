import taskpool from '@ohos.taskpool';

export class TaskDemo {
  createTask() {
    // 创建task
    let task = new taskpool.Task(run, "this is a bg task")
    // 执行task
    let result = taskpool.execute(task)
    // 取消task
    taskpool.cancel(task)
    result.then((data)=>{
      console.log("task:result= " + data)
    })
  }
}

@Concurrent
export function run(params: string): string {
  console.log("task: 执行一个自线程的任务咯" + params)
  return params
}

