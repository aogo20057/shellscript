PkgInstall() {
    PKGS=$*
    yum -q -y install $PKGS
    RET=$? && TrueFalse "$RET" "$PKGS 패키지 설치"
}

TrueFalse() {
    PRE_RET=$1
    PRE_MESS=$2
    if [ $PRE_RET -eq 0 ]; then
        echo "[ 정상처리 ] $2" 
    else
        echo "[ 에러발생 ] $2"
        exit 2
    fi
}

SrvStart() {
    # SrvStart stop/start/restart
    ACTION="$1"
    SVCNAME="$2"
    case $ACTION in
        'start')
            systemctl enable --now $SVCNAME >/dev/null 2>$1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동" 
            ;;
        'stop') 
            systemctl disable --now $SVCNAME >/dev/null 2>$1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동" 
            ;; 
        'restart')
            systemctl disable --now $SVCNAME >/dev/null 2>$1
            systemctl enable --now $SVCNAME >/dev/null 2>$1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동" 
            ;;
        *) echo "잘못된 입력입니다." ; exit 3 ;;
    esac
}


RebootYes() {
    while true
    do
        echo -n "[주의] 서버를 재부팅하시겠습니까??(yes/no) : "
        read ANSWER
        case $ANSWER in
            'yes' | 'y' | 'Yes' | 'Y' | 'YES') 
                RESULT=YES 
                shutdown -r +1 "재부팅합니다." 
                ;;
            'no' | 'NO' | 'No' | 'N' | 'n') 
                RESULT=NO 
                break 
                ;;
            *) 
                echo "[ FAIL ] 잘못된 입력을 하였습니다."
                ;;
        esac
    done
}



