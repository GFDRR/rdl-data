from setuptools import setup, find_packages

setup(
    name='rdl-data',
    version='0.0.1',
    url='https://github.com/GFDRR/rdl-data.git',
    author='GFDRR',
    author_email='',
    description='Risk Data Library data interface',
    package_dir = {
        '': 'python',
    },
    packages=find_packages('./python'),
    install_requires=[
        'numpy == 1.18.5', 
        'openquake.engine',
        'pandas == 1.0.5',
        'psycopg2',
        'sqlalchemy'
    ],
)


