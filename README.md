# 분리배출의 민족

팀페이지 주소 : https://kookmin-sw.github.io/capstone-2021-3/

- [분리배출의 민족](#분리배출의-민족)
  - [1. 프로젝트 소개](#1-프로젝트-소개)
  - [2. 소개](#2-소개)
    - [애플리케이션 기능 소개](#애플리케이션-기능-소개)
  - [3. 팀 소개](#3-팀-소개)
  - [4. 사용법](#4-사용법)
  - [5. 개발](#5-개발)
    - [협업 규칙](#협업-규칙)
      - [브랜치 명명 규칙](#브랜치-명명-규칙)
      - [Pull request 명명 규칙](#pull-request-명명-규칙)
      - [Commit 규칙](#commit-규칙)
    - [Application 문서](#application-문서)
    - [Backend 문서](#backend-문서)
    - [API 문서](#api-문서)
    - [Deep Learning 환경 설정](#deep-learning-환경-설정)

## 1. 프로젝트 소개

**플라스틱 컵 재활용 선순환 생태계 조성 프로젝트**

이번 프로젝트의 목표는 [Inobus 쓰샘](https://www.inobus.co.kr/story) 기기에 우리가 개발한 소프트웨어를 융합해 플라스틱 컵 재활용 선순환 생태계를 조성하는 것이다.

![ssam image](resources/SS_SAM.png)
플라스틱 컵에는 다양한 재질이 있다 (PET, PP, PLA). 플라스틱 컵이 제대로 재활용 하기 위해서는 재질별로 분류되어야 한다. 하지만 사람의 노동력은 비용이 높다. 이번 캡스톤 프로젝트에서 우리는 컴퓨터 비전을 활용한 자동화된 플라스틱 컵 재질 선별기를 개발한다.

또한, 기존 쓰샘 기기에 IOT 기기와 디스플레이를 장착해, 리워딩과 기부 시스템을 추가하여 컵 수거함을 이용하는 시민들의 참여를 유도한다.

마지막으로 쓰샘 기기의 위치찾기, 리워딩 등 다양한 서비스 이용을 편리하게 해줄 모바일 애플리케이션을 개발한다.

The goal of this project is to construct a recycling system by integrating our software to [Inobus's SS_SAM](https://www.inobus.co.kr/story).

To be recycled properly, plastic cups have to be classified by material (PET, PP, PLA). However, because of the high cost, It is hard to assign human resources to this job. In this capstone project, we develop an automated material classifier of plastic cups.

Moreover, we develop a rewarding and donating system by installing IOT and display to SS_SAM to encourage users’ participation.

Lastly, we develop a mobile application which provides services like finding the location of SS_SAM and checking reward points for user convenience.

## 2. 소개

### 애플리케이션 기능 소개

## 3. 팀 소개

```

허태정

Student ID : 20181708
E-Mail : gjdigj145@kookmin.ac.kr
Role : 팀장, 백엔드, 애플리케이션 (보조)
Github : [@Aqudi](https://github.com/Aqudi)

```

```

동설아

Student ID : 20171618
E-Mail : dsawt98@kookmin.ac.kr
Role : 애플리케이션
Github : [@TongSeola](https://github.com/TongSeola)

```

```

박정섭

Student ID : 20181616
E-Mail : parkjeongseop@kookmin.ac.kr
Role : 백엔드
Github : [@ParkJeongseop](https://github.com/ParkJeongseop)

```

```

허민호

Student ID : 20143115
E-Mail : gjalsgh1234@kookmin.ac.kr
Role : 딥러닝 모델 개발
Github : [@minoring](https://github.com/minoring)

```

## 4. 사용법

## 5. 개발

### 협업 규칙

#### 브랜치 명명 규칙

- kebab-case 사용

#### Pull request 명명 규칙

- 아래의 Commit 규칙과 동일하게 사용

#### Commit 규칙

- Prefix 사용
  - 추가: 파일추가
  - 구현: 기능 구현 및 개선
  - 버그: 버그 고치기
  - 문서: 문서작업
  - 포멧: 컨벤션 맞추기 등
  - 리팩터: 리팩토링할 때 사용
- 관련된 이슈가 있을 경우 Issue 링크 걸기
- Commit message 예시)

  ```
  구현: MongoDB 연동

  - 로컬에 DB서버를 구축하여 개발 진행
  - Device모델의 일부 항목 타입 변경

  Issue #41, #36
  ```

### [Application 문서](app/)

### [Backend 문서](backend/)

### [API 문서](backend/docs.html)

### [Deep Learning 문서](deep_learning/)
