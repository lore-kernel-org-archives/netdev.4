Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935720;
	b=MRm5EEdIt2JtB1Gs1k4OxTFvhzOI5h4FmPoOVkXoCWvq5iJI8yc3tVy6gF0Ctboac6qD
	 tlh/yYZt2qvxzkZ5pzbqwsYOj0IBBcPvRV+wW7UOo8ikT7iDme3MpDXm2NADCpDDyb1ne
	 X6COQ3Nbvw6L4di6GF5KSqpROhSgyqTTaUaAMb84+uUNMq/pma6sRr/uGPgOO5J57ay8B
	 etkMdeAgHJrFqULFuFqNtTkWvWp2bs2XWa/zgEkLon2kr5Fkp0tOkJFamK58QWVPR4KsM
	 v7MJMFDhrYz13oMbka+o83kzE0gwY/HZoAfEZE8qvkCkFXHYpWp3JEZL2zuyDpNwtow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/T3MP6BIfsWzbmst0ItY6XGUzGBFsEZPjPjgQjBYyA=;
	b=NBqj154/YbkSdNwU1IQ0uIR3wUNI03A/Q8zaeAUqxN64dXlwicXpGO/WtjtpdZzi106w
	 +JI1Y1nRYR6wYwqojg+lTLQ0ND9iPNhBz1FDtk5ZNU4cVAcwNYiL1V7XbGSn5gWcE6jyD
	 DGjN3DcUM3VhLVZpShLaarcMq/NCF2h4l3PBYSHyKU0fu823HoQcZDLxgBre/YJsIThmv
	 G1BHKaAuKiLyEdLgtJptNUAh5fHImnMl3Py7KmCnRbdgvKWpT3FeDdkgpreT2nV/uj3+h
	 nsIdgMqOwJuq3PLyqHWPbdhPAq0cGRfQlVSXzHHs9xJv96jqSCFUMJHS77nterOOsTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HeFnzvzQ;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D0606A332
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3D0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HeFnzvzQ
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e0082c434so10834241.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935719; x=1795540519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/T3MP6BIfsWzbmst0ItY6XGUzGBFsEZPjPjgQjBYyA=;
        b=HeFnzvzQ9atjaXKEeJj0HAz+lRrn7Lw9hxV+oSgHjVlLjguk1Nt+mSj9TVG44H6WdQ
         1Qfa4dKu9yEVFdLJmd9lW1Sj4qs58kgLU9RWIAQsFZtBhff5DbCXs/IAko1bNKzMY/0x
         OOaNSxF3lnR0W03KU5M/sAsikJfE5UZ6swzOjCg2AjL2AxAjh876OaSd8tLhCnBqeZQp
         iT3wfDX+HLDaSPMJYiUBsSVRL6VeiRlXKXnTpfK/2Nh5Z8o9UepytTu+pstLsK6rJ9x/
         dpey63XD8NhRmwKCXx5dj12M5YOnrzlO0rEL73bxTXbolKDdMQHY7KvnNmN6cAEHOgoH
         86gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935719; x=1795540519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/T3MP6BIfsWzbmst0ItY6XGUzGBFsEZPjPjgQjBYyA=;
        b=mrrkJAx/ciSBrrRaNnwiAidr0I3IAjESGGq+4xgrdOkpdiwvtN8PEgV24KCeXfSARY
         hP+SezsXshBh+XPdmwBnsH5gnbTqnUlrgit8fzgwufgb/82ifg9e7uarECIUDU0DDVPK
         zS0IlqGZMbMl7KXbT5eDI0zA8Naz29WII3KjW41oREALTx8PQ2M7dBXoMNTTF6VF9xWq
         Gry5v8PVriMPnNjryD1bQik/7s+CiGVzonVVAhnvoMZMyTlCcmPcmtxsokei+K5ZIkH4
         O30UGCUDazdXBgZjDbugDZDc3PndhXxcAFptJXVnxev+maZ4rk5d13tTCq/dupi3+RzL
         L9qg==
X-Forwarded-Encrypted: i=1; AL+hErH1a6lnHnPwZWzHaOM2TbDsVdTO2Czm6RS98PF+y7UmJoF1P61+oVOc90KzRPPvub8KecXscVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z980yBwrBM19AnZxodrwEQC+CfoEjWfrU+WXHVAeMITZdWaIDbf
	zlLkoSjOIySDeJcmi6FQOupilNaDNzXlC3sDJMETf8cvw6NlGdW981Ntp1dMYA==
X-Gm-Gg: AYBFou2rBJ2U7hZV92koD0u2fzgnn9vIPMrVLG06FI1DBuG3Y6Pnzq2c15edrLVXKfy
	X+1Nu+tJZcVJ07qYlEL9GUpOu+/oCM8jkB7YLSrOb/GOPN6q01//iO8vc2rxIKMmtDTNo/c12tk
	rSOKVAVEekokvv6obqJ+tIptPpn/adkVJeifTNFASnYE/zuVeQ++r/jHBx/u7p7IsxfL+nPS15k
	esqxCR4hXBRRJrI1Z/zYTstkYHtCSILQ3/ewhbCVstEBOirFpVQfU2w5Neaz/AfdT6v/rj6VvfW
	CYHcDIrsfmaXoAvYWpPI5E6TDY5jdMxKs66Eme8gNUi+EquffYrfozIWRRJrT1qgcebEcBQRn/7
	PBNW8eEqloK2lNBfltmizgEL8rBGTU7DPtaafLA1LYK37GrIG2B+j/9a8cTwJqilmgS4RwyjIyg
	jjVL/6RR3H2ZkSl8k2J8rvPzZBNoQVzNlUxDPbqLfRXAT1NvWROEVT6FHVsvkQylNjrflxQq4SZ
	L0+8J7L4rqoz4g8IniRWcJRyRYxk0dg25UhVZPN8ROtMzA6bGdryYGz3ULzeZSITDMGiLTP1uOk
	Tbhsslq0q2socuasx4FiHfJEPRiCeRsimTElCqHG985IvJ7KPkvO3EG6V+FRvRp1A7Qs4XBJu17
	BRIKciT9+RI3AColS9lXx7780m44AaHjLmC5DikwKXbuu7B15DAmidaiYQwBuR7lCui9D2wOX9G
	VpwSo=
X-Received: by 2002:a05:6102:d90:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d64d7044camr4099100137.13.1794935719187;
        Tue, 17 Nov 2026 09:15:19 -0800 (PST)
Received: from lvondent-mobl5.taila91cb8.ts.net ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a22d257sm156972241.6.2026.11.17.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:15:18 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [GIT PULL] bluetooth 2026-11-17
Date: Tue, 17 Nov 2026 12:15:16 -0500
Message-ID: <20261117171516.3560754-1-luiz.dentz@gmail.com>
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

The following changes since commit 1f2ac56137c51be0601e18a163d817e02a15913f:

  Bluetooth: L2CAP: Keep recvmsg from resuming a closed channel (2026-11-09 17:04:21 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2026-11-17

for you to fetch changes up to 5beb86f98c3d45f6d64be5b6d6c77480487b41b4:

  Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock (2026-11-17 11:39:36 -0500)

----------------------------------------------------------------
bluetooth pull request for net:

Core:

 - hci_conn: Initialize the device before hash insertion
 - hci_conn: Free the unset handle when adding a connection fails
 - hci_conn: Refuse new connections once HCI_UP is cleared
 - hci_sync: Set random address on the set's handle
 - hci_sync: Remove an advertising set by its handle
 - hci_sync: Drop the command's sk reference
 - hci_sync: Disable connection works before draining
 - hci_event: Find the owner of a terminated adv set
 - L2CAP: validate MPS and MTU in ECRED connection response
 - L2CAP: Protect the receive reject-list lookup
 - L2CAP: Fix size check for receive buffer space
 - L2CAP: clear the SDU before the receive callback
 - L2CAP: return LE credits from recvmsg under the conn lock
 - SMP: Fail if local and remote public key X coords match
 - MGMT: Fix runtime config status opcode
 - 6lowpan: Always consume the skb in chan_recv_cb

Drivers:

 - btintel: Don't log unsupported debug features as an error
 - btintel_pcie: Fix SCP DBGC base address
 - hci_qca: clear qca_memdump when discarding dump packets
 - hci_qca: Reopen the UART after enabling QCA2066
 - hci_qca: Don't use the serdev port after a failed reopen
 - hci_serdev: serialize flush with transmit work
 - hci_mrvl: Leave the serdev port lifetime to hci_serdev
 - vhci: Flush suspend work after removing debugfs
 - vhci: Serialize packet reception with device creation

----------------------------------------------------------------
Amir Abudubai (1):
      Bluetooth: L2CAP: Fix size check for receive buffer space

Cen Zhang (4):
      Bluetooth: hci_conn: Initialize the device before hash insertion
      Bluetooth: vhci: Flush suspend work after removing debugfs
      Bluetooth: vhci: Serialize packet reception with device creation
      Bluetooth: L2CAP: Protect the receive reject-list lookup

Chandrashekar Devegowda (1):
      Bluetooth: btintel_pcie: Fix SCP DBGC base address

Chun-Yi Lee (1):
      Bluetooth: SMP: Fail if local and remote public key X coords match

Hex Lindqvist (1):
      Bluetooth: btintel: Don't log unsupported debug features as an error

Jeremy Dean Clifton (3):
      Bluetooth: hci_conn: Free the unset handle when adding a connection fails
      Bluetooth: hci_conn: Refuse new connections once HCI_UP is cleared
      Bluetooth: hci_sync: Disable connection works before draining

Joas Antonio dos Santos (2):
      Bluetooth: hci_qca: clear qca_memdump when discarding dump packets
      Bluetooth: L2CAP: validate MPS and MTU in ECRED connection response

Luiz Augusto von Dentz (1):
      Bluetooth: 6lowpan: Always consume the skb in chan_recv_cb

Michael McAllister (1):
      Bluetooth: hci_mrvl: Leave the serdev port lifetime to hci_serdev

Nguyen Ngoc Thang (1):
      Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock

Piyus Kedia (1):
      Bluetooth: L2CAP: clear the SDU before the receive callback

Shuai Zhang (2):
      Bluetooth: hci_qca: Reopen the UART after enabling QCA2066
      Bluetooth: hci_qca: Don't use the serdev port after a failed reopen

Weihong Guan (5):
      Bluetooth: hci_sync: Set random address on the set's handle
      Bluetooth: hci_sync: Remove an advertising set by its handle
      Bluetooth: hci_core: Add hci_free_adv_instance()
      Bluetooth: hci_event: Find the owner of a terminated adv set
      Bluetooth: hci_sync: Drop the command's sk reference

Xu Rao (1):
      Bluetooth: MGMT: Fix runtime config status opcode

Zhao Li (1):
      Bluetooth: hci_serdev: serialize flush with transmit work

 drivers/bluetooth/btintel.c      |  11 ++--
 drivers/bluetooth/btintel_pcie.h |   2 +-
 drivers/bluetooth/btqca.c        |   1 +
 drivers/bluetooth/hci_mrvl.c     |  14 -----
 drivers/bluetooth/hci_qca.c      |  47 ++++++++++++--
 drivers/bluetooth/hci_serdev.c   |  17 ++++-
 drivers/bluetooth/hci_vhci.c     |   5 ++
 include/net/bluetooth/hci_core.h |   1 +
 include/net/bluetooth/l2cap.h    |   1 +
 net/bluetooth/6lowpan.c          |  18 ++++--
 net/bluetooth/hci_conn.c         |  20 +++++-
 net/bluetooth/hci_core.c         |  24 ++++---
 net/bluetooth/hci_event.c        |  42 +++++++++----
 net/bluetooth/hci_sync.c         | 131 +++++++++++++++++++++++++++++++++------
 net/bluetooth/l2cap_core.c       | 127 ++++++++++++++++++++++++++++---------
 net/bluetooth/l2cap_sock.c       |  12 ++--
 net/bluetooth/mgmt_config.c      |   2 +-
 net/bluetooth/smp.c              |  13 +++-
 18 files changed, 375 insertions(+), 113 deletions(-)
