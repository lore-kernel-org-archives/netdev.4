Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500354;
	b=O5e61nodqOszTza1FIOcEyMwPIOTKb4f1A1JnXIwiqJUhTggTDPsXWEu/Z2y2KBr2Pdd
	 0/5AM9Btq/VCdjTKYi2Q/XdGp5lXRwQ0Znz5ktZE5/odYUpZv842+gmOE61rbuOVAnw/8
	 Wj4l2ZfQCs8PST4jMWQB8JA33nHL0Z432ESnjgzHOrkVZ+hGzu90GIYZ8nIlffXP1qruD
	 xjy1Blg4TaeCGssPiJFc4q5qwzcCL3P6jRApri9DlGGrTKzlVJGYNFvn4krN8rvR7oJSL
	 J+80rBaEeb7cifWfY/bapbCvJ9CW/DxeGPfPpjbTiEblFcrkvXhzeJa2Zu0Bs82fViA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500354;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7tUtK96Vrc3ToBMYKBQfCF+TszVqJi2Mz9lx8dTS9vI=;
	b=RO/hfU5SkfFCYqDOQ72gfpWNSt9u2jD4xtCu3RDlTzq2X/vDS39I8zgvTmPb3D5NywSQ
	 fkLMnhN0jvNjo37eDsSB+GMJRSL1XR36JlpNJ9Kz+Y6Be0/x0LvcD+pGsHmuUV3iC0V+z
	 YqeIL34lm4U2DVcRRPSQOaTIUvh6pX6ViftGnoLG0t67ND77uK6VmO6TEz95dVr5X2IwL
	 VqtXw/H0b6mH5xMSPuHiR/2Bwmx3U9GGuF7tyl2QqdGa0OfgX3cQ8vUmAUqearBQBiLxI
	 0L4YoiXgjNqEkCHnUIPjLCu9Dub9mquVs7TN+FGYqfXWbHJINxDyopQzUgoAO3HlIIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE3606A322;
	Tue, 24 Nov 2026 06:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FE3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz6t1795500281tbf84aae7
X-QQ-Originating-IP: HubCRq5QX3Bt0PI2rOlOoWj9JBSinD7H+UjuhqbUBd8=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 14:04:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7542653238409347261
EX-QQ-RecipientCnt: 10
From: Dong Yibo <dong100@mucse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dong100@mucse.com,
	yaojun@mucse.com
Subject: [PATCH net-next v3 0/5] net: rnpgbe: Add basic management and statistics
Date: Tue, 24 Nov 2026 14:04:35 +0800
Message-ID: <6C54E9FB2E95869E+20261124060436.410989-1-dong100@mucse.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MXNHCNOZe6MOQH7q8x16Kld/oRFRgyMX0S2BPfh4mZu7PUJE4Bzrns/+
	zsXRes/fu3tcYo0QddtVpEdcVK5WDyUvkRkKcPap8Pf7jVLDEonP+TKKCagvWX/pIWJ2OWO
	vNZee5QUqeoELoNzxMjWLUMGKTi5xVXbaLqVGfPdeYrlmgfXf69CiuTk1Mb1FDqxhDfRXZY
	bN5/TGIWMOlrqcVhseqxghqpL+BMfKpROYkCjq54dVIMO78feMq0dsYuCycspBqiUn2EL9+
	QAVW8As3U94Sd5jxPdDpkl+TmOi7X5BdjJPL6tjkxtuuGn/UbyQVI51iV9u0MtmOMDRR5l/
	K3R7zpQpyeLkXeGLNtDA+9yr21kIhD7Qw6BD/w3UZpVI/2ZdzeSKgsAHHhu8ZfGP6cH19HC
	ZAPZCrhdfCU+TjUbcOCzcAnXht+5B0f0lgveYtl0VzQdWhY9r0tcP+j+AZSf1fEsovffSUU
	9LKthQ7Vyl+1PztV7mZudPBd7ElPp8OQDKRX2AjBI4yHRedvPibHGVQh3uohMWByICre1XP
	tMnnBjDmQzyg6z8/Ki71NCHlU44mtjW/bEik3UE89g5irAO1SMkyZ1lwky0fpib+s1gOjta
	buH+DqCK1SNc/HVJ/H9mUb6bCdL5XeDoWZFeGk56mwy1QxEOogM9vU79VlFpX8/pkRXdoh0
	28CGUHN7ienCo6oQ+7hm7nvSthQ9si2IQL59hFXuLCNy2BuObanpUEby3nON3rNx5i1Uc8o
	sULrLIe/Ain69psvf8zx/24b1KQHZaSlEyzFoGk/WiSWWZJyPRDCJXAe5Zv1zZ7CN1pbyZ0
	cqtRI1CdFj4p9ePssYSqcQ8hDR1t9zrv61ciDqaTkBflqMCZYXiEAslM4ept/rL4G86BUWC
	+f+r2AO7+b2+9ZtiISKI/iCVTp4bHf/8KotvVmDGwBlSujOefk3+1nWnblPxdbP1k6xRxLI
	0tLgpIgKWJnmtMnMAk8aH1Xw8jOEJo1P1+yfmkStID+SJI2/9XokEXIIPQd23yKV43sipRE
	Yh0S/g0Rsv+hronkHtOWfQwbY5c1coN+VtQojAFVM5Q1IZnRpL4U6Ji3XN/31Cc72m8+3nt
	am8ene+Ot9+3irSF/CwRw8=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

This patch series adds basic management and statistics support to the
RNPGBE driver.

The series introduces:
- Basic ethtool driver and link information
- Link settings reporting for copper, fibre and backplane ports
- Copper autonegotiation, speed/duplex and MDI/MDI-X configuration
- Primary MAC address changes
- Hardware and per-queue statistics

These changes allow users to inspect and configure the adapter and
monitor interface and queue statistics.

RX accounting follows the documented definitions of the two interfaces.
rtnl_link_stats64 includes good packets received by the host, including
those subsequently dropped by the driver. Netdev queue statistics count
packets successfully passed to the networking stack.

For example, an skb allocation failure increments rtnl RX packets/bytes
and rx_dropped, but does not increment queue RX packets/bytes. The
pkt_byte_sum selftest compares these totals directly, so its equality
check cannot hold after such a drop.

Native tests using the driver's RX and statistics functions verified
both accounting paths and reproduced this difference. The extracted
pkt_byte_sum function rejected the resulting counter values as expected.

Tested on N210 and N500 copper ports with firmware 1.1.8.0,
using an external module in a VM running Linux 7.3-rc6.
W=1 builds and Sparse checks passed.

The unmodified stats.py selftest reports four passes, three skips and
one failure per device. The failure occurs because the driver does not
support the channel configuration query required by
procfs_downup_hammer.

Additional tests passed for link configuration, MDI-X, MAC address
changes, queue statistics, multicast counters and concurrent statistics
reads during interface down/up cycles.

LLM assisted with development, testing and code review.

---
Changelog:
v2 -> v3:
[patch 2/5]
1. Remove TP from the advertising bitmap; retain it in supported
   and continue reporting PORT_TP.
2. Document the firmware capability requirements for default link
   configuration.
[patch 3/5]
1. Document firmware acknowledgement and timeout semantics for
   PHY_LINK_SET, including that a timed-out request is not applied
   later.

Links:
v1: https://lore.kernel.org/netdev/FB722C2F25FE9005+20261106112420.43050-1-dong100@mucse.com/
v2: https://lore.kernel.org/netdev/BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com/
---

Dong Yibo (5):
  net: rnpgbe: Add basic ethtool support
  net: rnpgbe: Report link settings through ethtool
  net: rnpgbe: Support copper link configuration
  net: rnpgbe: Allow changing the primary MAC address
  net: rnpgbe: Add hardware and queue statistics

 drivers/net/ethernet/mucse/rnpgbe/Makefile    |   2 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  24 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   |  57 +++-
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 254 ++++++++++++++++++
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |   3 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_lib.c    |  28 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  21 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |  42 ++-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h |  26 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.c  | 241 +++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.h  |  37 +++
 11 files changed, 725 insertions(+), 10 deletions(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h

-- 
2.50.1

