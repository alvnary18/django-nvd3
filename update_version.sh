#
# Usage:
#   ./update_version.sh 0.7.0
#

git flow release start v$1
sed -i -e "s/__version__ = '.*'/__version__ = '$1'/g" django_nvd3/__init__.py
sed -i -e "s/version = '.*'/version = '$1'/g" docs/source/conf.py
#rm -rf docs/html
#python setup.py develop
#make docs
#git commit docs django_nvd3/__init__.py -m "Update to version v$1"
git commit -a -m "Update to version v$1"
git flow release finish v$1
python setup.py sdist
twine upload dist/django-nvd3-$1.tar.gz
git push origin develop; git push origin master; git push --tags
