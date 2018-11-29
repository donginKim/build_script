#!/bin/bash
    
    if [ -e "project/build.gradle" ]; then
        echo "[INFO] Project is gradle ===== > Install gradle"
        add-apt-repository ppa:cwchien/gradle
        apt-get update
        apt-get install gradle -y
        echo "[INFO] Project is gradle ===== > gradle build"
       #gradle build
        if [ -e "project/gradlew" ]; then
        
            cd project
            ./gradlew build
            cd ../            
            cp -v project/build/libs/*.jar compile-out/compile.jar

        else

            cd project
            gradle clean jar
            if [ "$?" -ne 0 ]; then
                echo "[INFO] Gradle build Failed"
                exit 1
            fi
            cd ../
            cp -v project/build/libs/*.jar compile-out/compile.jar
            echo "[INFO] Gradle build successed"
        fi

    elif [ -e "project/pom.xml" ]; then
    
        echo "[INFO] Project is maven ===== > Install Maven"
        apt-get install maven
        cd project
        echo "[INFO] Project is maven ===== > maven build"
        mvn clean package

        if [ "$?" -ne 0 ]; then
            echo "[INFO] Maven build Failed"
            exit 1
        fi
        
        cd ../
        cp -v project/target/*.jar compile-out/compile.jar
        echo "[INFO] Maven build successed"
        
    else
      
      echo "[Error]"
      
      exit 1
      
    fi

# testing

    if [ -e "project/build.gradle" ]; then
        echo "[DEBUG] Project is gradle ===== > Install gradle"
        add-apt-repository ppa:cwchien/gradle
        apt-get update
        apt-get install gradle -y

		echo "[DEBUG] Project is gradle ===== > gradle JUnit test"
        
         if [ -e "project/gradlew" ]; then
            cd project
            
            ./gradlew clean test --info
            
                       
        else
            cd project
            
			gradle clean test --stacktrace
            
        fi
        

        if [ "$?" -ne 0 ]; then
            echo "[DEBUG] Gradle JUnit test Failed"
            exit 1
        fi
        
        echo "[DEBUG] Gradle JUnit test Success"
    fi

    if [ -e "project/pom.xml" ]; then
        echo "[INFO] Project is maven ===== > Install Maven"
        apt-get install maven
        cd project
        echo "[INFO] Project is maven ===== > maven JUnit test"
        mvn test

        if [ "$?" -ne 0 ]; then
            echo "[DEBUG] Maven JUnit test Failed"
            exit 1
        fi

        echo "[INFO] Maven JUnit test Success"

    fi
