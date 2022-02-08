DIR=${DIR:-tnef}
rm -rf $DIR-*.tar.gz

if [ ! -d $DIR ]; then
   git clone https://github.com/verdammelt/tnef.git
elif  [ -d $DIR ]; then
   cd $DIR
   git pull
   cd ..
fi

cd $DIR
VERSION=$(git describe --long --tags --abbrev=6 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')

cd .. || exit 1

echo "version = ${VERSION}"
mv ${DIR} ${DIR}-${VERSION}
echo tar vczf "${DIR}-${VERSION}.tar.gz" "${DIR}-${VERSION}"
tar vczf "${DIR}-${VERSION}.tar.gz" "${DIR}-${VERSION}"
mv ${DIR}-${VERSION} ${DIR}


