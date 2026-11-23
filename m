Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455253;
	b=VnzvIsRigl7j/l6/LEwhDr8Vz+E7NjxSNjz8SSEOvO4P/usiwLpWL2ZuZtc6BhB5o903
	 yxcTgJA5iOUGqkAWNSyHXlxyoObegDH9D/qyUfZZKXvLQQ4dmjKLqIYsMTrwJedTMxqTw
	 GSj2+OjXBJDjmVYJa7qNDe6bfLRUzy9XpAELbh0eG1oxhYCiNraJyNI9QhAAbXSbXq+Ok
	 Z6u/OYS/ioSKHdakxXqYRmYseNXRfG1aRsPe1ctcis/tZ8/o761b0PPB1r+jXsrlspWZP
	 nQUTcFfTW0FxcHjgM9qv0s3waOjL/dzAwizIS4jweI/yAHMwijMWlRfQELrP26whipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pTxUnvDjANJ9l3Kj71UoNPPJRMztFFW3BLCmjld/5QU=;
	b=B1n31heoK1nvP7EGoSRzTD/mXnSSZcw9jFPTxgL7yQaX9gj5ZppXDcAuqF5a7bHGx1a4
	 bi2bYhTZ7Dlc87XJH1x2lmii1YQxTxOMGZz7jvDdE8yMfTCpwvIvNp1jqqOL32NZEtMoG
	 w26aiKwS+CJnohrUf+p93+AwjIM82+v13bTjlzvMx4sXeVBTkXwlIoS2W952xYJqfIweg
	 CPGs6hdOumaAsHKT3Pr08al1Tvry0DIhdq6xLa0pcDeL1rDFOdRxU9sWDhakvOXQ1lheg
	 w5pF5BNVCgITY73fX6yHvM/uU4PUt5UqPiZ5zN6aPwDMHcFOoPmChDC6JUr2vbR3gbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u1uw1e7/";
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FBA606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FBA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1uw1e7/
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1112504137.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455251; x=1796060051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTxUnvDjANJ9l3Kj71UoNPPJRMztFFW3BLCmjld/5QU=;
        b=u1uw1e7/ldotRYzQiqhdMXwBwX/do6GuppzXT7t26WdY5wCItLn2mHAybEoOh6K1sV
         edhmhM/2wmic1XFgM87SKigjkf7TMZ17XdVsILe84q69AlxZj+JPDqJmPQDZfahxhnnD
         k8tz1vivuzMigWmAp3gP8qBF5YpcwTjrt59OZUa0NWvPVJUlkgTTPyXswIBhyam5aBKv
         xjkhnqw9MrqOA9egrqNv35zw6uen2VnJkmnMvb//y+xcX/mYB7ZhZSO05DvPdD86BPJF
         wTcNZZMh4E8kkVZV3vcospU53oDpuiY5+tTtxI7wNVChAWOu6A3qXQ2rE5LVGZ0f3m+x
         ZJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455251; x=1796060051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTxUnvDjANJ9l3Kj71UoNPPJRMztFFW3BLCmjld/5QU=;
        b=vQTZXQUfJ6FWFsaeg74M5fSyhb2AdA0LhZBMNF9ymivk8GB23SADAkRH0yhXj8BZKT
         Smk2sJl0S3iYcKUuO1qH7Wvtu8X0O6F8LrY0hIrEgjulK8RdpvHJZFBeMSndRvy84jDl
         +NGipFjD/9aHvuFGGQUDyDM255UD9iFB81GTnJu8M74R5MgybYPkjOwVaauBMqsLu/Da
         6CBudOVD1pxXtDeZkUepNqODJOCV3A5TpbbiQBHejD+qc0PjIQvLtNjQSoEufyJh0Vk2
         Sy8G4YHPUbqwoCYtmHVbiu+9YHUle+zVkFLEMihozr8aNg+9CNkgQPp33+OHLZfWDB1i
         8HqA==
X-Forwarded-Encrypted: i=1; AL+hErFGVFgHnDt/tZK9HEZ4HAavBo8um+OzxIy/Oae+fAX6sSf/oB3dSTWhQBybXKcepCFMN9IQrVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PEnms2jz08xOCF/aq4bCTgmAlXZU5vW4dxcH1kijEEefIu9YE
	AaBDkO9CZa7GbEKVWO4BNAtl9sZEpHJ9otqQR26tdWtjs4y4q9C3leRX
X-Gm-Gg: AZFdTZcLaY9JetdynEZqvC+tLXyO940o9fgjo2iwT9ZX3bf4JYqEsv14c+UgxMPzDRF
	3FBx5nVJBHTb+zx+WJobSAbdutTSv9tULcR6fbFVqhuj+incmqHrvTrVxqr+jdng1iKweKL69M0
	8sfJZqfUiXI5XAQ/6cwK7r3zQLLpQcJQJgfmH9ft+cKx/9OM0Adqo3BvdetG60TzWvmAWnyHXkN
	2+OKwWKEbkUdchTJkzrRWasEsANI1DBMdWQbMZt5Qi9b2te5OKvmZZ2yOUJcJOSk7znvECrFyK4
	kHENgo39pmSHtXNAB0R4bV4alsUZQ37PoeIxhgBlAQNOi8ZtrF7UWf0ua0dk4Zu/WvjsNnvxGs3
	JAszY7NNvaG37lqtlo50Xy2n56HA+bnh2oQd6Gb5NYLYyYh1ZEs5Gw/4RmBy22U9UA8IWxucDdC
	Tg/loM3t9xjOQwfrUZ0ThbZzdrqdgKKFbHz/WopV7d6sCaA1lJMYw5n+zIxz8CK9QzQbuFHAl2x
	w4cJ72cGBy8ksKnGuyesD2smH6rU2RbjkA12OKWzwX670gzYdhnQMHpS3261k8ooHH0l9gOtmfm
	bIlre0xOZPnIB520OIQHmJ0pS6KP5k65d92zdN2yw3k1Pzras5dWe7mZo+ujZ8v7LwxkIjMo1Oo
	jH5GRBuA6LpVgoETgASGMrscoOkHxfSrmgaC/NcXB6QtutFpJqQVI88zYaA94Bry6
X-Received: by 2002:a67:e706:0:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d73942ad2emr4987813137.21.1795455251020;
        Mon, 23 Nov 2026 09:34:11 -0800 (PST)
Received: from lvondent-mobl5.taila91cb8.ts.net ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm12635830137.11.2026.11.23.09.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:34:10 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [GIT PULL] bluetooth 2026-11-23
Date: Mon, 23 Nov 2026 12:34:08 -0500
Message-ID: <20261123173408.3632176-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5beb86f98c3d45f6d64be5b6d6c77480487b41b4:

  Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock (2026-11-17 11:39:36 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2026-11-23

for you to fetch changes up to 4fe38719e6738feaa90486e36b0790dd5d960a96:

  Bluetooth: btintel_pcie: Fold MAC_INIT into btintel_pcie_get_mac_access() (2026-11-20 10:57:23 -0500)

----------------------------------------------------------------
bluetooth pull request for net:

Core:

 - hci_core: Take req_sync lock in hci_power_on()
 - hci_core: Hold hdev->lock when removing advertisement monitors
 - hci_core: Don't fail removing a monitor unknown to the controller
 - hci_sync: Lock the lookup in hci_disable_ext_adv_instance_sync()
 - hci_sync: Hold hdev->lock in hci_schedule_adv_instance_sync()
 - hci_sync: Fix remaining advertising instance UAFs
 - hci_sync: Use controller handles for periodic advertising
 - hci_event: Validate sent command length in LE Set Ext Adv Enable
 - hci_debugfs: Fix racy toggling of debugfs controlled flags
 - L2CAP: Use a reserved ident for L2CAP_LE_CREDITS
 - L2CAP: Don't use uninitialized EFS in l2cap_parse_conf_rsp()
 - SMP: Serialize link key updates from smp_notify_keys()
 - SMP: Check smp_data before using SMP_DEV()
 - SMP: Don't create the BR/EDR channel while unregistered
 - MGMT: Fix read_index_list() buffer overflow
 - MGMT: Reject zero multi advertising rotation duration
 - MGMT: Fix mesh transmission locking and lifetime
 - MGMT: Fix use-after-free in mgmt_powering_down()
 - MGMT: Retain the selected legacy advertising schedule ID
 - MSFT: Protect the event prefix with hdev->lock
 - MSFT: Free the response of the monitor commands
 - MSFT: Record the filter state on Command Disallowed
 - MSFT: Only enable the advertisement filter with monitors

Drivers:

 - btintel_pcie: Set only MAC_INIT in btintel_pcie_mac_init()
 - btintel_pcie: Fold MAC_INIT into btintel_pcie_get_mac_access()
 - btrtl: Propagate errors if btrtl_vendor_read_reg16() fails
 - btrtl: Return -ENOMEM if bt_skb_alloc() fails

----------------------------------------------------------------
Cen Zhang (2):
      Bluetooth: hci_sync: Fix remaining advertising instance UAFs
      Bluetooth: hci_sync: Use controller handles for periodic advertising

Kiran K (2):
      Bluetooth: btintel_pcie: Set only MAC_INIT in btintel_pcie_mac_init()
      Bluetooth: btintel_pcie: Fold MAC_INIT into btintel_pcie_get_mac_access()

Luiz Augusto von Dentz (17):
      Bluetooth: mgmt: Fix read_index_list() buffer overflow
      Bluetooth: hci_core: Take req_sync lock in hci_power_on()
      Bluetooth: hci_sync: Lock the lookup in hci_disable_ext_adv_instance_sync()
      Bluetooth: hci_sync: Hold hdev->lock in hci_schedule_adv_instance_sync()
      Bluetooth: SMP: Serialize link key updates from smp_notify_keys()
      Bluetooth: SMP: Check smp_data before using SMP_DEV()
      Bluetooth: SMP: Don't create the BR/EDR channel while unregistered
      Bluetooth: hci_event: Validate sent command length in LE Set Ext Adv Enable
      Bluetooth: mgmt: Reject zero multi advertising rotation duration
      Bluetooth: L2CAP: Don't use uninitialized EFS in l2cap_parse_conf_rsp()
      Bluetooth: mgmt: Fix mesh transmission locking and lifetime
      Bluetooth: MGMT: Fix use-after-free in mgmt_powering_down()
      Bluetooth: MSFT: Protect the event prefix with hdev->lock
      Bluetooth: hci_debugfs: Fix racy toggling of debugfs controlled flags
      Bluetooth: hci_core: Hold hdev->lock when removing advertisement monitors
      Bluetooth: MSFT: Free the response of the monitor commands
      Bluetooth: hci_core: Don't fail removing a monitor unknown to the controller

Nguyen Ngoc Thang (1):
      Bluetooth: L2CAP: Use a reserved ident for L2CAP_LE_CREDITS

Thomas de Gruijter (2):
      Bluetooth: MSFT: Record the filter state on Command Disallowed
      Bluetooth: MSFT: Only enable the advertisement filter with monitors

Tzung-Bi Shih (2):
      Bluetooth: btrtl: Propagate errors if btrtl_vendor_read_reg16() fails
      Bluetooth: btrtl: Return -ENOMEM if bt_skb_alloc() fails

Zhao Li (1):
      Bluetooth: MGMT: Retain the selected legacy advertising schedule ID

 drivers/bluetooth/btintel_pcie.c |  31 +---
 drivers/bluetooth/btrtl.c        |   9 +-
 include/net/bluetooth/hci_core.h |   7 +
 include/net/bluetooth/l2cap.h    |   5 +
 net/bluetooth/hci_core.c         |  81 ++++++++-
 net/bluetooth/hci_debugfs.c      |  32 +++-
 net/bluetooth/hci_event.c        |   9 +-
 net/bluetooth/hci_sync.c         | 344 +++++++++++++++++++++++++++--------
 net/bluetooth/l2cap_core.c       |  33 ++--
 net/bluetooth/mgmt.c             | 377 ++++++++++++++++++++++++++++++---------
 net/bluetooth/mgmt_config.c      |   8 +
 net/bluetooth/mgmt_util.c        |  23 ++-
 net/bluetooth/msft.c             | 118 ++++++++----
 net/bluetooth/smp.c              |  58 ++++--
 14 files changed, 861 insertions(+), 274 deletions(-)
