import observer from '@ohos.arkui.observer';
import { BottomTabTag } from '../const/const'; // import 类 from 文件
import { httpRequestTest, httpTest } from '../http/Net';
import { FragMine } from '../pages/FragMine'
import { FragHome } from './FragHome';
import { FragMsg } from './FragMsg';
import { window } from '@kit.ArkUI';
import worker from '@ohos.worker';
import { TaskDemo } from '../task/task';

const TAG = "binghao"
@Entry
@Component
struct Index {
  @State curItem: string = BottomTabTag.bottomTabHome
  @State message: string = 'Hello World';
  @State statusBarHeight: number = 0
  listener: (info: observer.RouterPageInfo) => void = (info: observer.RouterPageInfo) => {
    let routerInfo: observer.RouterPageInfo | undefined = this.queryRouterPageInfo()
    if (info.pageId == routerInfo?.pageId) {
      // 生命周期事件
      switch (info.state) {
        case observer.RouterPageState.ON_PAGE_SHOW: {
          console.log(`${TAG}:on_page_show`)
          break
        }
        case observer.RouterPageState.ON_PAGE_HIDE: {
          console.log(`${TAG}:on_page_hide`)
          break
        }
        case observer.RouterPageState.ABOUT_TO_APPEAR: {
          console.log(`${TAG}:about_to_appear`)
          break
        }
      }
    }
  }

  // 重写声明周期方法，传入listener
  aboutToAppear(): void {
    let uiObserver = this.getUIContext().getUIObserver()
    uiObserver.on('routerPageUpdate', this.listener)
    this.getStatusBarHeight() // 更新状态栏高度
  }

  aboutToDisappear(): void {
    let uiObserver = this.getUIContext().getUIObserver()
    uiObserver.off('routerPageUpdate', this.listener)
  }

  build() {
    RelativeContainer() {
      if (this.curItem == BottomTabTag.bottomTabMine) {
        FragMine().alignRules({
          bottom: { anchor: 'bottom_bar', align: VerticalAlign.Top }
        })
      } else if (this.curItem == BottomTabTag.bottomTabHome) {
        FragHome().alignRules({
          bottom: { anchor: 'bottom_bar', align: VerticalAlign.Top },
        })
      } else if (this.curItem == BottomTabTag.bottomTabMsg) {
        FragMsg().alignRules({
          bottom: { anchor: 'bottom_bar', align: VerticalAlign.Top }
        })
      }

      BottomBar({ curItem: this.curItem })
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
        .id('bottom_bar')
    }.padding({ top: this.statusBarHeight * 2 })
    .height('100%')
    .width('100%')
  }

  private getStatusBarHeight() {
    window.getLastWindow(getContext(this), (error, topWindow) => {
      if (topWindow) {
        let area = topWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        this.statusBarHeight = px2vp(area.topRect.height)
        console.log("statusBar height = " + this.statusBarHeight)
      }
    })
  }
}

@Component
struct BottomItem {
  image_sel: ResourceStr = ""
  image_nor: ResourceStr = ""
  @Link curItemTag: string
  tag: string = ""
  itemName: string = ""
  onItemClick: (n: string) => void = () => {
  }

  build() {
    Column() {
      if (this.curItemTag == this.tag) {
        Image(this.image_sel).width(30).height(30).onClick(() => {
          this.onItemClick(this.tag)
          console.debug("click:" + this.tag)
        })
      } else {
        Image(this.image_nor).width(30).height(30).onClick(() => {
          this.onItemClick(this.tag)
          console.debug("click:" + this.tag)
        })
      }

      if (this.curItemTag == this.tag) {
        Text(this.itemName).fontSize(12).fontColor($r('app.color.xl_main'))
      } else {
        Text(this.itemName).fontSize(12).fontColor($r('app.color.black_trans_30'))
      }
    }
  }
}

@Component
struct BottomBar {
  @Link curItem: string

  build() {
    Row() {
      BottomItem({
        image_sel: $r('app.media.ic_home_dis_sel'),
        image_nor: $r('app.media.ic_home_dis'),
        curItemTag: this.curItem,
        tag: BottomTabTag.bottomTabHome,
        onItemClick: (tag: string) => {
          this.curItem = tag
          console.debug("out click = " + tag)
        },
        itemName: "首页"
      })
      BottomItem({
        image_sel: $r('app.media.ic_home_msg_sel'),
        image_nor: $r('app.media.ic_home_msg'),
        curItemTag: this.curItem,
        tag: BottomTabTag.bottomTabMsg,
        onItemClick: (tag: string) => {
          this.curItem = tag
          console.debug("out click = " + tag)
        },
        itemName: "消息"
      })
      BottomItem({
        image_sel: $r('app.media.ic_home_mine_sel'),
        image_nor: $r('app.media.ic_home_mine'),
        curItemTag: this.curItem,
        tag: BottomTabTag.bottomTabMine,
        onItemClick: (tag: string) => {
          this.curItem = tag
          console.debug("out click = " + tag)
          // sendWorkMsg()
          new TaskDemo().createTask()
        },
        itemName: "我的"
      })
    }
    .width('100%')
    .height(63)
    .backgroundColor($r('app.color.white'))
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

export function sendWorkMsg() {
  let tag = "Main Worker"
  let url = 'entry/ets/worker/worker.ets';
  let workerInstance: worker.ThreadWorker = new worker.ThreadWorker(url, { name: "worker_thread" }) // 创建worker实例
  workerInstance.onmessage = (data) => { // 监听子线程消息
    console.log(`${tag},data = ` + JSON.stringify(data));
  }

  workerInstance.postMessage("Hello sub thread,I am main thread")
}