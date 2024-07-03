@Component
export struct FragMine {
  build() {
    Column() {
      TopArea()
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "签到" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "账户充值" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "我的兑换" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "我的守护" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "任务中心" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "邀请有奖" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "联系客服" })
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "设置" })
    }.width('100%')
    .height('100%')
  }
}

@Component
struct SettingItem {
  iconRes: ResourceStr = $r('app.media.ic_upage_sign_in')
  title: string = ""

  build() {
    Row() {
      Image(this.iconRes).width(26).height(26).margin({ left: 16 })
      Text(this.title).fontSize(14).fontColor($r('app.color.text_setting_item')).margin({ left: 16 }).layoutWeight(1)
      Image($r('app.media.arr_right_gray')).width(16).height(16).margin({ right: 16 })
    }
    .width('100%')
    .height(58)
  }
}

@Component
struct TopArea {
  build() {
    RelativeContainer() {
      Image($r('app.media.ic_avatar_default_female'))
        .width(85).height(85)
        .id("image_avatar")
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
        })

      Column() {
        Text("嘻嘻公主-molly").fontSize(16).fontColor(Color.Black).fontWeight(FontWeight.Bold)
        Text("悦恋号:123456").fontSize(12).fontColor($r('app.color.xl_main'))
      }.alignRules({
        top: { anchor: 'image_avatar', align: VerticalAlign.Center },
        // bottom: { anchor: 'image_avatar', align: VerticalAlign.Bottom },
        // middle: { anchor: 'image_avatar', align: HorizontalAlign.Center },
        left: { anchor: 'image_avatar', align: HorizontalAlign.End },
      })
    }.width('100%')
    .height(112)
  }
}