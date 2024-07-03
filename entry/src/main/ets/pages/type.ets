import { Point } from '@ohos.UiTest'

function type(params: string) {
  // str 类型
  let name = "hello world"
  name += "haha"

  // str 模版
  let str = `hello ,${name}` // 反单引号

  // arr 类型
  let arr: string[] = ['apple', 'banana', 'cherry']

  // 枚举类型
  enum ColorSet { Red = 0xff0000, Green = 0x00ff00, Blue = 0x0000ff}

  let red: ColorSet = ColorSet.Red

  // union 类型
  class Cat {
    sleep() {
    } // 睡觉

    meow() {
    } // 喵喵叫
  }

  class Dog {
    sleep() {
    }

    wang() {

    } // 汪汪叫
  }

  type Animal = Cat | Dog | number
  let animal: Animal = new Cat()
  let num: Animal = 0

  // aliases类型 别名
  type Matrix = number[][]
  type Handler = (s: string, num: number) => String

  for (let i = 0; i < 10; i++) {
  }


  for (let fruit of arr) {

  }

  let error: Error | null = null // 双类型变量

  // lambda类型
  let callback = (): void => {
  }

  // record
  let map:Record<string,number> = { 'John':5 }
}


// 可选参数，传入时可空，变成undefined
function hello(params?: string) {
}

// 默认参数，传入时可省略
function hello1(name: string = "Tom") {
}

// rest 参数 任意数量的参数
function foo(...numbers: number[]) {
  for (let n of numbers) {
  }
}

// callback 参数
function callbackFunc(block: (n: number) => number) {

}

// 闭包类型 g实例维持了它的环境变量的饮用，因此z被调用时，变量count仍可用
function f(): () => number {
  let count = 0
  let g = (): number => {
    count++
    return count
  }
  return g
}

let z = f()
z() // 返回1
z() // 返回2

// 函数重载
function foo1(x: number): void;

function foo1(x: string): void;

function foo1(x: string | number) {
}

// 类
class Person {
  name: string = ''
  surname: string = ''
  static count:number = 0 // 静态变量

  constructor(name: string, sn: string) {
    this.name = name
    this.surname = sn
  }
}

// 创建类
let p1 = new Person("Uchiha", "Sasuke")
let p2: Point = {
  x: 0,
  y: 0
}