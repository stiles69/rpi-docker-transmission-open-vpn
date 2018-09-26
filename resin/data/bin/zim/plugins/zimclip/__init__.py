# -*- coding: utf-8 -*-
'''
Zim clip plugin
'''
import json
import logging
import os
import sys

from zim import ZIM_EXECUTABLE
from zim.notebook import Path
from zim.plugins import PluginClass

logger = logging.getLogger('zim.plugins.zimclip')

app_name = 'zimclip'

HOME_DIR = os.path.expanduser("~")

BASE_PATH = os.path.dirname(os.path.realpath(__file__))

CFG_PATH = os.path.join(BASE_PATH, 'config.json')

MANIFEST_NAME = 'zimclip.json'

MANIFEST_PATHS = {
    'linux2': {
        'firefox': os.path.join(
            HOME_DIR,
            '.mozilla',
            'native-messaging-hosts'
        ),
        'chromium': os.path.join(
            HOME_DIR,
            '.config',
            'chromium',
            'NativeMessagingHosts'
        ),
        'chrome': os.path.join(
            HOME_DIR,
            '.config',
            'google-chrome',
            'NativeMessagingHosts'
        )
    },
    'darwin': {
        'firefox': os.path.join(
            HOME_DIR,
            'Library',
            'Application Support',
            'Mozilla',
            'NativeMessagingHosts'
        ),
        'chromium': os.path.join(
            HOME_DIR,
            'Library',
            'Application Support',
            'Chromium',
            'NativeMessagingHosts'
        ),
        'chrome': os.path.join(
            HOME_DIR,
            'Library',
            'Application Support',
            'Google',
            'Chrome',
            'NativeMessagingHosts'
        )
    },

#    'win32': {
#        'firefox': os.path.join(BASE_PATH, 'win', 'firefox'),
#        'chromium': os.path.join(BASE_PATH, 'win', 'chromium')
#    }
}

class ZimClipPlugin(PluginClass):
    '''
    Zimclip plugin: copy app manifests and configure namespaces
    '''
    plugin_info = {
        'name': 'Zim Clip', # T: plugin name
        'description': _(
            'Copy app manifests files for\n'
            'the zim-clip web browser addon.\n'
            'Only for Firefox and Chromium\n'
            'on Linux and Mac OS X.\n'
        ), # T: plugin description
        'author': 'Rui Nibau',
        'version': '1.0.3'
    }

    plugin_preferences = (
        # key, type, label, default
        ('marks', 'namespace', _('Marks page'), Path(':marks')), # T: input label
        ('clips', 'namespace', _('Clips namespace'), Path(':clips')), # T: input label
    )

    def __init__(self, config=None):
        PluginClass.__init__(self, config)
        self.add_manifests()
        self.preferences.connect('changed', self.on_preferences_changed)
        self.on_preferences_changed(self.preferences)

    def teardown(self):
        '''
        Remove app manifests on deactivation
        '''
        self.remove_manifests()

    def on_preferences_changed(self, preferences):
        '''
        Write data for zimclip web browser extension
        '''
        cfg_file = open(CFG_PATH, 'w')
        cfg_file.write(json.dumps({
            'path': ZIM_EXECUTABLE,
            'marks': str(preferences['marks']),
            'clips': str(preferences['clips'])
        }))
        cfg_file.close()

    def add_manifests(self):
        '''
        Add app manifests for supported browsers.
        '''
        platform = sys.platform
        if platform in MANIFEST_PATHS:
            for browser, path in MANIFEST_PATHS[platform].items():
                if not os.path.exists(path):
                    os.makedirs(path)
                mpath = os.path.join(path, MANIFEST_NAME)
                if os.path.isfile(mpath) is False:
                    logger.info('zim-clip: Installing app manifest for ' + browser)
                    logger.debug(mpath)
                    # read template
                    tpl_file = open(os.path.join(BASE_PATH, 'data', browser + '.json'), 'r')
                    tpl = tpl_file.read()
                    tpl_file.close()
                    data = json.loads(tpl)
                    # Update template data
                    data['path'] = os.path.join(BASE_PATH, 'zimclip.py')
                    # write manifest
                    m_file = open(mpath, 'w')
                    m_file.write(json.dumps(data))
                    m_file.close()
        else:
            logger.info('zim-clip: Platform not supported')

    def remove_manifests(self):
        '''
        Remove app manifests.
        '''
        platform = sys.platform
        if platform in MANIFEST_PATHS:
            for browser, path in MANIFEST_PATHS[platform].items():
                mpath = os.path.join(path, MANIFEST_NAME)
                if os.path.isfile(mpath):
                    logger.info('zim-clip: Removing app manifest for ' + browser)
                    logger.debug(mpath)
                    os.remove(mpath)
