import { CircleShape } from '@ohos.arkui.shape'

@Component
export struct FragMine {
  build() {
    Column() {
      TopArea()
      Text("").width('100%').height(8).backgroundColor($r('app.color.bg_main'))
      SettingItem({ iconRes: $r('app.media.ic_upage_sign_in'), title: "签到" })
      SettingItem({ iconRes: $r('app.media.ic_upage_pay'), title: "账户充值" })
      SettingItem({ iconRes: $r('app.media.ic_upage_earnings'), title: "我的兑换" })
      SettingItem({ iconRes: $r('app.media.ic_upage_guard'), title: "我的守护" })
      SettingItem({ iconRes: $r('app.media.ic_upage_tasks'), title: "任务中心" })
      SettingItem({ iconRes: $r('app.media.ic_upage_invite'), title: "邀请有奖" })
      SettingItem({ iconRes: $r('app.media.ic_upage_feedback'), title: "联系客服" })
      SettingItem({ iconRes: $r('app.media.ic_upage_setting'), title: "设置" })
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

@Preview
@Component
struct TopArea {
  build() {
    RelativeContainer() {
      // 头像
      Image($r('app.media.ic_home_rec_default'))
        .width(80)
        .height(80)
        .margin({ left: 15 })
        .id("image_avatar")
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
        })
        .objectFit(ImageFit.Cover)
        .clipShape(new CircleShape({ width: 80, height: 80 }))

      // 昵称
      Column() {
        Text("嘻嘻公主-molly").fontSize(16).fontColor(Color.Black).fontWeight(FontWeight.Bold)
        Text("悦恋号:123456").fontSize(12).fontColor($r('app.color.xl_main')).margin({ top: 6 })
      }.alignRules({
        center: { anchor: 'image_avatar', align: VerticalAlign.Center },
        // bottom: { anchor: 'image_avatar', align: VerticalAlign.Bottom },
        // middle: { anchor: 'image_avatar', align: HorizontalAlign.Center },
        left: { anchor: 'image_avatar', align: HorizontalAlign.End },
      })
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 12 })

      // 点赞
      Row() {
        NumData({ title: "好友", num: "1234" })
        NumData({ title: "关注", num: "999" })
        NumData({ title: "粉丝", num: "1032" })
        NumData({ title: "获赞", num: "21.3w" })
      }.width('100%').height(20).justifyContent(FlexAlign.SpaceEvenly)
      .alignRules({
        top: { anchor: 'image_avatar', align: VerticalAlign.Bottom }
      })
    }
    .width('100%')
    .height(112)
  }
}

@Component
struct NumData {
  title: string = ""
  num: string = ""

  build() {
    Row() {
      Text(this.title).fontSize(12).fontColor($r('app.color.black_trans_60'))
      Text(this.num).fontSize(16).fontColor(Color.Black).fontWeight(FontWeight.Bold)
    }
  }
}