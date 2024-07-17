const tempList: string[] =
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
    "", "", ""]

@Component
export struct FragMsg {
  @State curIndex: number = 0
  private ctl = new SwiperController()

  build() {
    Column() {
      // 顶部tab
      Row() {
        MsgTab({ title: "消息", isSelect: this.curIndex == 0 }).margin({ left: 16 }).onClick(() => {
          this.curIndex = 0
          this.ctl.changeIndex(0, true)
        })
        MsgTab({ title: "亲密用户", isSelect: this.curIndex == 1 }).margin({ left: 20 }).onClick(() => {
          this.curIndex = 1
          this.ctl.changeIndex(1, true)
        })
        MsgTab({ title: "谁看过我", isSelect: this.curIndex == 2 }).margin({ left: 20 }).onClick(() => {
          this.curIndex = 2
          this.ctl.changeIndex(2, true)
        })
      }.width('100%').height(43)

      Swiper(this.ctl) {
        List() {
          ForEach(tempList, (item: string) => {
            ListItem() {
              MsgItem()
            }
          })
        }.width('100%').height('100%').scrollBarWidth(0)

        List() {
          ForEach(tempList, (item: string) => {
            ListItem() {
              MsgItem()
            }
          })
        }.width('100%').height('100%').scrollBarWidth(0)

        List() {
          ForEach(tempList, (item: string) => {
            ListItem() {
              MsgItem()
            }
          })
        }.width('100%').height('100%').scrollBarWidth(0)
      }.onChange((index) => {
        this.curIndex = index
      })
      .loop(false)
      .indicator(false)

    }.margin({ bottom: 63 })
  }
}

@Component
struct MsgItem {
  build() {
    RelativeContainer() {
      // 头像
      Image($r('app.media.ic_msg_avatar_sample'))
        .alignRules({ center: { anchor: '__container__', align: VerticalAlign.Center } })
        .width(50)
        .height(50)
        .id("avatar")
        .margin({ left: 12 })

      // 昵称、消息内容
      Column() {
        Text("牛奶水果").fontColor($r('app.color.black')).fontSize(16)
        Text("这条信息还没回复，不要错过难得的缘分～").fontColor($r('app.color.xl_main')).fontSize(12)
      }.alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        left: { anchor: 'avatar', align: HorizontalAlign.End }
      }).margin({ left: 10 }).alignItems(HorizontalAlign.Start)

      Text("12:25").fontSize(12).fontColor($r('app.color.black_trans_40')).alignRules({
        right: { anchor: '__container__', align: HorizontalAlign.End },
        center: { anchor: '__container__', align: VerticalAlign.Center }
      }).margin({ right: 12 })
    }.width('100%').height(78)
  }
}

@Component
struct MsgTab {
  title: string = ""
  @Prop isSelect: boolean = true

  build() {
    Column(){
      if (this.isSelect) {
        Text(this.title).fontSize(22).fontColor($r('app.color.black'))
        Rect().radiusWidth(25).width(9).height(3).fill($r('app.color.xl_main'))
      } else {
        Text(this.title).fontSize(17).fontColor($r('app.color.black_trans_60'))
      }
    }
  }
}