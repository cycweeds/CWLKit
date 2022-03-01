

podspec=`ls -1 | grep ".podspec$"`
echo '找到podspec文件：'$podspec


versionNumber=`grep -E 's.version.*=' $podspec`
versionNumber=${versionNumber#*\'}
versionNumber=${versionNumber%*\'}
echo '当前版本：'$versionNumber

# 添加到git
git add .
git commit -m "version $versionNumber update"
git tag -f ${versionNumber}
git push -f origin master --tags


 pod trunk push ./$podspec --allow-warnings
