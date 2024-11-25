# cerebro 0.9.4 자동 설치 및 설정 setup 앤서블


## 참조 파일

- **전체 파이프라인 플레이북**: `cerebro_deploy.yml`

## 각 파일 설명

1. **`hosts.ini`** : 인벤토리(관리 대상 시스템 리스트)
2. **`main.yml`** : play_book 변수를 담은 파일
3. **`tar_scp.sh`** : cerebro 각 서버에 tar파일 생성
4. **`cerebro_deploy.yml`** : 앤서블 플레이북

## 실행 방법

1. `cerebro_deploy.yml` 플레이북을 실행하여 전체 파이프라인을 시작합니다.
   ```sh
   ansible-playbook -i /data/cerebro_0.9.4_ansible/hosts.ini /data/cerebro_0.9.4_ansible/cerebro_deploy.yml
   ```

## ansible 플레이북 구조

- `Create cerebro_tar directory`: 각 cerebro 서버에 기본 cerebro 디렉토리, zip 저장할 디렉토리 생성
- `Copy cerebro_zip to servers`: tar_scp.sh 스크립트를 실행하여 cerebro zip 파일 각 서버 tar 저장 디렉토리에 복사
- `Extract cerebro_zip`: 각 서버 cerebro zip파일 압축 해제
- `sb_link`: 각 서버 cerebro 링크 설정

---

이 플레이북은 cerebro 클러스터를 자동으로 설정하고 Start 하는 과정을 자동화 합니다.
