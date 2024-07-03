import observer from '@ohos.arkui.observer';
import { BottomTabTag } from '../const/const'; // import 类 from 文件
import { FragMine } from '../pages/FragMine'
import { FragHome } from './FragHome';

@Entry
@Component
struct Index {
  @State curItem: string = BottomTabTag.bottomTabHome
  @State message: string = 'Hello World';
  listener: (info: observer.RouterPageInfo) => void = (info: observer.RouterPageInfo) => {
    let routerInfo: observer.RouterPageInfo | undefined = this.queryRouterPageInfo()
    if (info.pageId == routerInfo?.pageId) {
      // 生命周期事件
      switch (info.state) {
        case observer.RouterPageState.ON_PAGE_SHOW: {
          break
        }
        case observer.RouterPageState.ON_PAGE_HIDE: {
          break
        }
        case observer.RouterPageState.ABOUT_TO_APPEAR: {

        }
      }
    }
  }

  // 重写声明周期方法，传入listener
  aboutToAppear(): void {
    let uiObserver = this.getUIContext().getUIObserver()
    uiObserver.on('routerPageUpdate', this.listener)
  }

  aboutToDisappear(): void {
    let uiObserver = this.getUIContext().getUIObserver()
    uiObserver.off('routerPageUpdate', this.listener)
  }

  build() {
    RelativeContainer() {
      // Text(this.message)
      //   .id('HelloWorld')
      //   .fontSize(50)
      //   .fontWeight(FontWeight.Bold)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
      //   .onClick(() => {
      //   })
      if (this.curItem == BottomTabTag.bottomTabMine) {
        FragMine()
      } else if (this.curItem == BottomTabTag.bottomTabHome) {
        FragHome()
      } else if (this.curItem == BottomTabTag.bottomTabMsg) {
        FragHome()
      }

      BottomBar({ curItem: this.curItem })
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct BottomItem {
  image_sel: ResourceStr = ""
  image_nor: ResourceStr = ""
  @Link curItemTag: string
  tag: string = ""
  onItemClick: (n: string) => void = () => {
  }

  build() {
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
        }
      })
      BottomItem({
        image_sel: $r('app.media.ic_home_msg_sel'),
        image_nor: $r('app.media.ic_home_msg'),
        curItemTag: this.curItem,
        tag: BottomTabTag.bottomTabMsg,
        onItemClick: (tag: string) => {
          this.curItem = tag
          console.debug("out click = " + tag)
        }
      })
      BottomItem({
        image_sel: $r('app.media.ic_home_mine_sel'),
        image_nor: $r('app.media.ic_home_mine'),
        curItemTag: this.curItem,
        tag: BottomTabTag.bottomTabMine,
        onItemClick: (tag: string) => {
          this.curItem = tag
          console.debug("out click = " + tag)
        }
      })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}