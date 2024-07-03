import { print } from '@kit.BasicServicesKit';
import { Point } from '@ohos.UiTest';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
        })
    }
    .height('100%')
    .width('100%')
  }
}

// 资源引入
struct Test{

  build() {

  }

}