# **Timer App**

## **사용 기술 & 라이브러리**
UIkit, Timer(), AVFoundation

---
## **구현내용**
slider

타이머

선 그리기

사운드 플레이

---

## **프로젝트를 하면서 배운점**
+ slider 사용방법

slider를 사용해 값을 받고 받은 값을 이용하여 필요한 값을 계산후 다시 UILabel에 값을 전달하여 화면에 표시

value, Minimum, Maximum값을 설정할수 있으며 

.value 또는 .setValue(value: Float, animate: Bool)을 사용하여 값을 이용하여 초기값을 설정하거나 slider의 값을 다른 변수에  전달할수 있다 

+ Timer()

자기가 원하는 시간마다 함수를 실행할수 있다. 나는 1초마다 타이머를 1초씩 줄여야 하는것을 구현하고 싶었고 그것을 구현하기 위해서는 Timer() class를 사용했고 이것을 사용할때 강한 참조와 약한참조에 대해서 조금더 공부할수 있는 시간이 되었다.
```
weak var timer : Timer()

// [weak self]가 아닌 [self]만 사용해도 강한 참조 사이클이 발생하지 않기때문에 괜찮다
timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
    ... 
}

timer?.invalidate() // 또한 타이머를 다 사용하고 난 후에는 메모리에서 제거하기위해 작성해야한다

```
+ selector

Timer를 다르게 구현할수 있는데 

```
weak var timer : Timer()

timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)

@objc func doSomethingAfter1Second(){
    ...
}
```

위에 코드처럼 구현하고 싶을때는 selector에는 함수의 주소를 전달해야하고 함수의 주소를 전달하기 위해서는 @objc를 적어야한다

+ 사운드 플레이(앱에서 소리내는 법)

AVFoundation 안에 있는 기능중 시스템 사운드를 이용할수 있었다

---

## **구현 영상**
<img width="50%" src="https://user-images.githubusercontent.com/100309352/169304411-46ba90de-f057-4d70-9129-9e83d62e5714.gif"/>    
