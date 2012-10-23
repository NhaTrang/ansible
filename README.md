## Ansible

Ruby-based home automation scripting framework for KNX and ZWave devices.

(c) 2012 Elias Karakoulakis <elias.karakoulakis@gmail.com>

## Requirements

Ansible requires a USB Zwave Controller (http://www.aeon-labs.com/site/products/view/2/), stompserver_ng, and Thrift4OZW.

## Getting Started

Require the ansible gem in your gem file or manually add it to your gem installation.

```
gem 'ansible'
```

or

```
gem install ansible
```

## Basic Usage

Start up stompserver_ng (https://github.com/gmallard/stompserver_ng)

```
stompserver_ng -d -l DEBUG -b 0.0.0.0
```

Start Thrift4OZW daemon (https://github.com/ekarak/Thrift4OZW)

```
 ./ozwd 
[0x10cf580] BoostStomp:starting...
[0x10cf580] BoostStomp:STOMP TCP connection to 127.0.0.1:61613 is active
[0x10cf580] BoostStomp:Sending CONNECT frame...
OpenZWave configuration dir: /home/jjg/ozw/open-zwave/config/
OpenZWave user dir: /home/jjg/ozw/Thrift4OZW/
2012-10-23 01:17:59:536 mgr,     Added driver for controller /dev/ttyUSB0
[0x10d20b0] BoostStomp:Worker thread: starting...
2012-10-23 01:17:59:537   Opening controller /dev/ttyUSB0
2012-10-23 01:17:59:537 Trying to open serial port /dev/ttyUSB0 (attempt 1)
2012-10-23 01:17:59:556 Serial port /dev/ttyUSB0 opened (attempt 1)
2012-10-23 01:17:59:557 contrlr, Queuing command: FUNC_ID_ZW_GET_VERSION: 0x01, 0x03, 0x00, 0x15, 0xe9
2012-10-23 01:17:59:557 contrlr, Queuing command: FUNC_ID_ZW_MEMORY_GET_ID: 0x01, 0x03, 0x00, 0x20, 0xdc
2012-10-23 01:17:59:557 contrlr, Queuing command: FUNC_ID_ZW_GET_CONTROLLER_CAPABILITIES: 0x01, 0x03, 0x00, 0x05, 0xf9
2012-10-23 01:17:59:558 contrlr, Queuing command: FUNC_ID_SERIAL_API_GET_CAPABILITIES: 0x01, 0x03, 0x00, 0x07, 0xfb
2012-10-23 01:17:59:558 contrlr, Queuing command: FUNC_ID_ZW_GET_SUC_NODE_ID: 0x01, 0x03, 0x00, 0x56, 0xaa
2012-10-23 01:17:59:558 contrlr, WriteMsg WriteNextMsg m_currentMsg=040010e0
2012-10-23 01:17:59:558 
2012-10-23 01:17:59:559 contrlr, Sending command (Callback ID=0x00, Expected Reply=0x15) - FUNC_ID_ZW_GET_VERSION: 0x01, 0x03, 0x00, 0x15, 0xe9
2012-10-23 01:17:59:562 contrlr,   ACK received CallbackId 0x00 Reply 0x15
2012-10-23 01:17:59:563 contrlr,   Received: 0x01, 0x10, 0x01, 0x15, 0x5a, 0x2d, 0x57, 0x61, 0x76, 0x65, 0x20, 0x32, 0x2e, 0x37, 0x38, 0x00, 0x01, 0x9b
2012-10-23 01:17:59:564 
2012-10-23 01:17:59:564 contrlr, Received reply to FUNC_ID_ZW_GET_VERSION:
2012-10-23 01:17:59:564 contrlr,     Static Controller library, version Z-Wave 2.78
2012-10-23 01:17:59:564 contrlr,   Expected reply was received
2012-10-23 01:17:59:565 contrlr,   Message transaction complete
...
2012-10-23 01:17:59:642 
2012-10-23 01:17:59:642 mgr,     Driver with Home ID of 0x016a0a11 is now ready.
2012-10-23 01:17:59:643 
...
------------------------------------------------------------------------
OpenZWave is initialized, Thrift interface now listening on port 9090
------------------------------------------------------------------------
```

Require ansible in your Ruby/Rails app or irb.

```
$ irb
1.9.3p194 :001 > require 'ansible'
 => true 
 
tranny = ZWave::ZWave_Transceiver.new(STOMP_URL, THRIFT_URL_)

=> #<Ansible::ZWave::ZWave_Transceiver:0x007fd0e9935640  ......

notification_DriverReady (n:1) (b:0) ()
TODO
notification_NodeAdded (n:1) (b:0) ()
TODO
notification_NodeProtocolInfo (n:1) (b:0) ()
TODO
notification_EssentialNodeQueriesComplete (n:1) (b:0) ()
------ SETTING HOME ID: 0x16a0a11
Thrift: New heartbeat thread, #<Thread:0x007fd0e8e2a200>
```

Toggle a switch

```
office_lamp = AnsibleValue[ :_nodeId => 7 ]
 => [<Ansible::ZWave::ValueID _homeId:23726609, _nodeId:7, _genre:ValueGenre_Basic (0), _commandClassId:32, _instance:1, _valueIndex:0, _type:ValueType_Byte (1)>, <Ansible::ZWave::ValueID _homeId:23726609, _nodeId:7, _genre:ValueGenre_User (1), _commandClassId:37, _instance:1, _valueIndex:0, _type:ValueType_Bool (0)>, <Ansible::ZWave::ValueID _homeId:23726609, _nodeId:7, _genre:ValueGenre_System (3), _commandClassId:39, _instance:1, _valueIndex:0, _type:ValueType_List (4)>] 

office_lamp[1].set false

2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==true(TrueClass).fire_callback, event onBeforeSet: about to fire: {}
+++ updating value 2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==true(TrueClass), with FalseClass:false
2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==false(FalseClass).fire_callback, event onUpdate: about to fire: {}
2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==false(FalseClass).fire_callback, event onSetSuccess: about to fire: {}
 => [] 
1.9.3p194 :007 > notification_ValueChanged (n:7) (b:0) (2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==false(FalseClass))
2012-10-23 01:26:42 -0700 ZWaveValue[n:7 g:1 cc:37 i:1 vi:0 t:0]==false(FalseClass).fire_callback, event onValueChanged: about to fire: {}
```

More questions? Find me on #openzwave on freenode.