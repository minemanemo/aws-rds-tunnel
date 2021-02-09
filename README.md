# 로컬 PC에서 RDS 터널링을 위한 스크립트

## Requirement

* ssm manager를 통한 연결을 위한 설정
* 현재 linux와 mac OS만 지원

## Install

```bash
$ sudo ./install_for_macNlinux.sh
```

## Menual

1. 터미널을 열고 명령어 실행

   ```bash
   $ aws-rds-tunnel {ec2 instance id} {az} {local port} {RDS DNS address} {RDS Port}
   ```

   * **ec2 instance id** : 터널링을 할 인스턴스의 ID
   * **az** : 인스턴스가 속한 가용영역
   * **local port** : Local PC에서 터널링할 Port
   * **RDS DNS address** : RDS 서비스의 DNS 주소
   * **RDS Port** : RDS 서비스의 Port 번호

   ```bash
   # result
   
   $ tunnel-rds aws-rds-tunnel i-example ap-northeast-2a 3306 ex-database.ap-northeast-2.rds.amazonaws.com 3306
   
   Warning: Permanently added 'i-example' (ECDSA) to the list of known hosts.
   
   [connect by cli]
   mysql -h127.0.0.1 -uUSERID -pPASSWORD
   
   Press any key to close session.
   ```

   🚦위 스크립트는 로컬의 3306 포트를 i-example 인스턴스를 통하여 ex-database.ap-northeast-2.rds.amazonaws.com의 3306 포트로 포워딩 하는 명령어 입니다.
   

2. 다른 터미널 열기 후 아래 명령어로 데이터 베이스 접속 확인

   ```bash
   $ mysql -h127.0.0.1 -uUSERID -pPASSWORD
   ```

   

3. 기존 터미널에서 아무 키 입력 시 터널 종료