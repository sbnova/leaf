1. mapper id가 다를경우
   - mapper파일(MyBatis의 쿼리문을 등록한 XML파일)에 <select id=''.. 에 id와 
     mapper파일에 직접 접근하는 java파일(DAO나 service)에 적어놓은 id값이 다른 경우 
2. Parameter와 bean의 필드명이 틀린 경우
3. mapper파일(MyBatis의 쿼리문을 등록한 XML파일)에 정의된 네임스페이스(namespace)와 
   mapper파일에 직접 접근하는 java파일(DAO나 service)에서 호출하는 네임스페이스(namespace)가 다를 경우
4. MyBatis config파일에 mapper가 정의가 되어 있지 않거나 Spelling이 틀린 경우
5. mapper에 정의된 namespace 명칭이 같은 Application 내에 중복 될 경우

