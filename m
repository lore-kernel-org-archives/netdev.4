Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011132;
	b=saGQbHJGcCqS1ljS77eNeL+GPcND0BmtBaVA6VEKIqIEXU+EAY+EDkr7zidxrxGOvVaN
	 HQ/qGtpgT4lgzWDbm4x7v0ar7b38B+6J/O25o8PZsQd3VGydkKulxPcIyFbUbMSUDtDzi
	 +BUEDXTe9Z7Km5ogtWDPGnJUbaK2tJxe+nvFLH/xWkMPLHNY+BLSjQdWzQj7BpsO21YDe
	 1Ubfs0n8TTZj7y7Ht88OKWnvMNubnMYlJjT8UryQUIL/iS0/qiaXOszm/SctzdaLzgp6O
	 uGg0il3mFuZB3ashlzaKTMdpxEJJboYYNsAmiVs18I2Mvxn9WSsmGg9JuSjKusiJ9jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011132;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=hojdwrIITI4zkYtiYiRVHN6AZWC3dKU7aVs/egORTGg=;
	b=AQcxlc/A7+Gb5pyLubzggTWut+rVcR3Ki2qz4NcgJ13+OC2J8jOX73dn/knJzMk69YYO
	 TUEMQzD8b95OzmqzskxS+N2WGSkf2OYFikHzRoOhpX9AMWtrzJoOjCvvE4zcBEtZMpWUM
	 xZ93+hJLDtjlvYk6CNVnUbe+kJpGouoYyj2HuZgkhksF/mfWgENRQ9I0liLAjhrcGTSPb
	 cmEyZDt7rnedRLPl9xobSo3p2vT2vY4m6VUpiWfI2BNqVlXELSuvd0+CoEcbC5WNrbYqJ
	 H0m/bfwSii0q1TYY+vSLx17jKfeVM30XrRRBGgcSc9kWF43qmVPHpy2/IzQXUWi3xOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ugreen.com;
	spf=pass smtp.mailfrom=ugreen.com;
	dkim=pass header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=hq0F3Ch4;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94826606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94826606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ugreen.com header.i=@ugreen.com header.a=rsa-sha256 header.s=pkvm2402 header.b=hq0F3Ch4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1795011098;
	bh=hojdwrIITI4zkYtiYiRVHN6AZWC3dKU7aVs/egORTGg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=hq0F3Ch4HWG43mYwPAbRu9DUkwqd8RXCP0fs92VY9oQDZsdK740Rv0SshOOiP+ZRU
	 RsA0BUNbGwMtyt9VtQjMrmCILR7MJJSFP4kfQJXNI8PtxoJJTUyFjcl/75D56BFVy2
	 2kw0IjL2SYmTiIq5wRDwSMuXFfqDfnt8nXxgcHEU=
X-QQ-mid: esmtpgz11t1795011096t4302abd2
X-QQ-Originating-IP: 6M+pst5Rwr46zckO5aa0WJLFAE3nxp7+63f6wWWgYrk=
Received: from exmail.qq.com ( [14.155.219.48])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 22:11:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15232806219287984304
From: Hanson Wang <hanson.wang@ugreen.com>
To: netdev@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com
Subject: [RFC] r8169: possible TX completion ordering issue on arm64
Date: Wed, 18 Nov 2026 22:11:30 +0800
Message-Id: <20261118141130.2694997-1-hanson.wang@ugreen.com>
X-Mailer: git-send-email 2.34.1
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
Feedback-ID: esmtpgz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OA8qd4daQrT+6oqn275lL6SDcTpdszQh1bg6kSzR3bwZt+SEPdtq/vuT
	UOnOIrg2YD0fjENpY4+kKgcpGh5NGFCCsqeMtpAaHQemaVbtdcjw9piL46jU360NUfiPdh7
	8f2AL4xI7AHgxuehol9vRPR5x5lMoU+lTy+GAt2G5097nBMdO3unnzzGW2S2L06sbOMwu/M
	OW2M72WvvTiCFNfbVvlxRY6VOd4plbjyJ63Gfa5z5r+0wB2OSplX7SayNARohO0YrXepIGz
	PtU6yYZ+eKJsugGTZtlJUDX5wiZknYB8XMPADAYiBWaTeH1unWJlDJwPampw3fa0Z2aPjj3
	fNyWTzg6cI9ZC7Y9wPUdCu9K4BCothAo1r9lTuKbJdtUY1sU7/xLDwPY3+5IvC18ZOw8X64
	UA6JFQnK9as2N34CD0nM4adfeX1hOiJSHRTzfi5iHlAb4PEbNjtMG1wtRfuLcHG4gxKfShN
	SO8R8NGf9eKKnFNv/2cees3r97Bay7OJIRVYjfSjINr5wN9HRFldwBInxbaLhtsSNnZjBxh
	HCogBgOFAm49FEANu7xajwc3S3PHbzhsQfpx2Bcweu04ZwWJO1GmR3hW6RL/aQBnxfsxcxJ
	BKgUfhOuf43GCXAS3M17YktK1+o/VQLn3ATsUhppotU9DLtjIhNmhtm8z0Ty4K7RdwQTxvN
	UUbJwOvng6taMEIYcWJ1Sy7J+Zh7BdsatsaWNt5KJKnruuwTE728YnVFh0iGYs+NzzpL4tv
	LxszpL8deEDF1nHx7lA5tEgKecf73hsVG2qdXPDGq0pTIoNBYUD8+ftGT9XRUnad/Yyl7yV
	4AQPyT5nOzIiNzHYPlewx6Dj9WquHcIODQZw8jsjUPYnIiRAnceAHVV8tTmFEBYISPgxi6k
	rxn1HGddvDPFwztbbfrZFY0FwVezcbLYFFFTunsOqBbiTra7Hkd3C+LxpGPw18l/xBbXbck
	xjQHAf01nVOIoBy7AaOGAvD0ti3tDS7gTORbIluidkK9Xb+xRWf6NU/igs9m0YfkXG8q4Pu
	K2bXvPbnf057+fYm289X9HNspQb1ACJMI4o64chf4mv2dn6lV85wgjdPtzgge96+1aPBCrs
	Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi,

We observed four crashes in dql_completed() on an RK3588-based arm64
board (UGREEN RK3588C DH4300Plus).  The NIC is an RTL8125B, XID 641,
at PCI 0002:21:00.0, linked at 2.5Gbps.  The kernel is a vendor
6.1.84 build (6.1.84 #d64bed19bdfd).  We compared the cur_tx publish
and read with current mainline and that part looks the same:
rtl8169_start_xmit() still does smp_wmb() followed by WRITE_ONCE(),
and rtl_tx() still does READ_ONCE() before reading the descriptor.
The vendor tree still calls netdev_completed_queue() directly; mainline
has since switched that call to netif_subqueue_completed_wake().  We
have not reproduced this on mainline.

All four oopses stop at the same place:

  kernel BUG at lib/dynamic_queue_limits.c:27!
  Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
  pc : dql_completed+0x13c/0x14c
  lr : rtl8169_poll+0x3a0/0x54c [r8169]

One of them, from idle softirq:

  CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W   E     6.1.84 #d64bed19bdfd
  Hardware name: UGREEN RK3588C DH4300Plus Board (DT)
  Call trace:
   dql_completed+0x13c/0x14c
   __napi_poll+0x3c/0x1d0
   net_rx_action+0x16c/0x3a0
   __do_softirq+0x120/0x338
   ____do_softirq+0x14/0x20
   call_on_irq_stack+0x24/0x40
   do_softirq_own_stack+0x20/0x30
   __irq_exit_rcu+0x98/0xc0
   irq_exit_rcu+0x14/0x20
   el1_interrupt+0x48/0xa0
   el1h_64_irq_handler+0x14/0x20
   el1h_64_irq+0x74/0x78
   arch_cpu_idle+0x14/0x40
   ...
  Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt

Another is the same pc/lr from process context (ctl_serv), entering
softirq via el0_interrupt.  Two of the four were preceded by
"NETDEV WATCHDOG: eth0 (r8169): transmit queue 0 timed out" and
"ASPM disabled on Tx timeout".  The other two were not.

dql_completed() is called as (dql, count).  At the BUG the registers
are:

  x1 = 0x00000570   x2 = 0x00000534   delta = 0x3c
  x1 = 0x000007de   x2 = 0x000007a2   delta = 0x3c
  x1 = 0x000009d8   x2 = 0x0000099c   delta = 0x3c
  x1 = 0x00001091   x2 = 0x00001055   delta = 0x3c

The failing check is BUG_ON(count > num_queued - num_completed).  The
branch goes straight to the BRK, so x1 is still count and x2 is still
num_queued - num_completed.  In every case the completion count is
0x3c = 60 = ETH_ZLEN bytes ahead of the outstanding BQL count, which
is one short frame padded to the minimum length.  RTL_GIGA_MAC_VER_63
pads such frames to ETH_ZLEN.  We have not established why the counts
diverge.

While looking at the TX path I noticed that rtl8169_start_xmit()
publishes the new ring index with:

  smp_wmb();
  WRITE_ONCE(tp->cur_tx, tp->cur_tx + frags + 1);

and rtl_tx() then does:

  while (READ_ONCE(tp->cur_tx) != dirty_tx) {
          status = le32_to_cpu(READ_ONCE(tp->TxDescArray[entry].opts1));

On arm64 a control dependency does not order the later load of opts1,
or the later read of the BQL counters, against the load of cur_tx.
smp_wmb() orders the writer's stores, but the reader has no pairing
barrier.  A CPU could observe the new cur_tx, still see DescOwn clear
on a descriptor that has not been handed to the hardware, and account
that skb in netdev_completed_queue() before __netdev_sent_queue() is
visible.  That would trip this BUG_ON.  I may be missing an ordering
guarantee that already covers this.

Would an acquire load on the reader be appropriate here?

  -     while (READ_ONCE(tp->cur_tx) != dirty_tx) {
  +     while (smp_load_acquire(&tp->cur_tx) != dirty_tx) {

This is a question, not a fix.  We have not A/B tested it, and we have
not reproduced the oops on mainline.

Thanks,
Hanson Wang
