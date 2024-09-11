// test

// 自定义圆环
@Component
@Preview
export struct Ring {
  build() {
    Stack({ alignContent: Alignment.Center }) {
      Circle()
        .width('100%')
        .height('100%')

      Circle()
        .width(83)
        .height(83)
        .fill(Color.White)
    }.width(90)
    .height(90)
  }
}

class RingAttribute {
  radius: number = 45 // 圆环半径
  width: number = 5 // 圆环宽度
  color: Color | number | string | Resource = '#000000' // 圆环颜色
  solid: Color | number | string | Resource = '#ffffff' // 填充颜色

  // 过滤非法参数
  public static filter(ringAttribute: RingAttribute): RingAttribute {
    if(null == ringAttribute){
      ringAttribute = new RingAttribute()
    } else {
        let defaultAttribute = new RingAttribute()
      if(undefined == ringAttribute.color){
        ringAttribute.color = defaultAttribute.color
      }
    }

    return ringAttribute
  }
}