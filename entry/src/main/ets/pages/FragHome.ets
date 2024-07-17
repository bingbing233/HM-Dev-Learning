import { DrawContext } from '@kit.ArkUI'
import { drawing } from '@kit.ArkGraphics2D'

const tempList: string[] =
  ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",]

@Component
export struct FragHome {
  private swiperController = new SwiperController()
  @State curIndex: number = 0

  build() {
    Column() {
      // logo
      Image($r('app.media.ic_home_logo')).width(81).height(30).margin({ left: 12 })

      // tab
      Row() {
        if (this.curIndex == 0) {
          Text("热门").fontSize(18).fontColor($r('app.color.black')).onClick(() => {
            this.curIndex = 0
            this.swiperController.changeIndex(0, true)
          })
          Text("新人").fontSize(16).fontColor($r('app.color.black_trans_60')).margin({ left: 20 }).onClick(() => {
            this.curIndex = 1
            this.swiperController.changeIndex(1, true)
          })
        } else {
          Text("热门").fontSize(16).fontColor($r('app.color.black_trans_60')).onClick(() => {
            this.curIndex = 0
            this.swiperController.changeIndex(0, true)
          })
          Text("新人").fontSize(18).fontColor($r('app.color.black')).margin({ left: 20 }).onClick(() => {
            this.curIndex = 1
            this.swiperController.changeIndex(1, true)
          })
        }

      }.width('100%').height(44).alignItems(VerticalAlign.Center).margin({ left: 16 })

      // vp组件
      Swiper(this.swiperController) {
        HomePage()
        HomePage()
      }
      .width('100%')
      .height('100%')
      .indicator(false)
      .loop(false)
      .onChange((index) => {
        this.curIndex = index
      })

    }.width('100%').alignItems(HorizontalAlign.Start).margin({ bottom: 63})
  }
}

@Component
struct HomePage {
  @State refreshing: boolean = false;

  build() {
    // 刷新
    Refresh({ refreshing: this.refreshing }) {
      // 列表
      Grid() {
        ForEach(tempList, (item: string) => {
          GridItem() {
            HomeRecItem()
          }
        })
      }
      .margin({ left: 12, right: 12, bottom: 10 })
      .columnsGap(10)
      .rowsGap(10)
      .columnsTemplate("1fr 1fr") // 分成两份且均分
    }.width('100%').onRefreshing(() => {
      // do refresh job
      this.refreshing = true
      setTimeout(()=>{
        this.refreshing = false
      },3000)
    })
  }
}

@Preview
@Component
struct HomeRecItem {
  build() {
    RelativeContainer() {
      Image($r('app.media.ic_home_rec_default')).borderRadius(12)

      Image($r('app.media.ic_tease')).width(40).height(40).alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      }).margin({ right: 8, bottom: 8 })

      OnlineText().alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top },
        right: { anchor: '__container__', align: HorizontalAlign.End },
      }).margin(4)

      Image($r('app.media.ic_real_auth'))
        .width(17)
        .height(17)
        .margin(8)
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .id('image_real')

      TagText({ text: "23岁" }).alignRules({
        center: { anchor: 'image_real', align: VerticalAlign.Center },
        left: { anchor: 'image_real', align: HorizontalAlign.End }
      }).margin({ left: 4 }).id("tag_age")

      TagText({ text: "广州" }).alignRules({
        center: { anchor: 'tag_age', align: VerticalAlign.Center },
        left: { anchor: 'tag_age', align: HorizontalAlign.End }
      }).margin({ left: 4 })

    }.width('100%').height(192).borderRadius(12)

  }
}

@Preview
@Component
struct OnlineText {
  build() {
    Text("在线")
      .fontColor(Color.White)
      .fontSize(12)
      .fontWeight(FontWeight.Bold)
      .backgroundColor($r('app.color.online_text'))
      .padding({
        top: 5,
        bottom: 5,
        right: 6,
        left: 12
      })
      .drawModifier(new GreenDot())
      .borderRadius(100)
  }
}

@Component
struct TagText {
  text: string = ""

  build() {
    Text(this.text)
      .fontColor($r('app.color.tag_text'))
      .fontSize(11)
      .backgroundColor($r('app.color.tag_text_bg'))
      .borderRadius(100)
      .padding({
        left: 5,
        right: 5,
        top: 1,
        bottom: 1
      })
  }
}

@Component
struct GradientBg {
  build() {
    // Canvas(){}.linearGradient({angle:0,direction:GradientDirection.Bottom,colors:[$r()]})
  }
}


class GreenDot extends DrawModifier {
  drawFront(drawContext: DrawContext): void {
    let size = drawContext.size
    let brush = new drawing.Brush()
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 255,
      blue: 0
    })
    console.log(`w=${size.width} h=${size.height}`)
    drawContext.canvas.attachBrush(brush)
    drawContext.canvas.drawCircle(20, 12 * 3, 4)
  }
}