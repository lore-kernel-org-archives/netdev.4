Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126554;
	b=emdPLDLFjW77mpaKhzCrChfQet7G89lHvlWhFbwTV8Gso0GatFkiKU3124vIMROnlD1h
	 ZjCUPRIuSnW6DyIkSfWrf//SDL6Aup59A8eDQNU78wo7VZdm5yrYX2rzV8jz3SaMJKGHj
	 DMBq2UQDV0WB/W1qzS0KJR7/tzxK7sW4LUKa6PBL903qMc2nEBzyQHd4EkH/NXowMrbvU
	 KWyLJ4GXaUT3Ugnlu9+JBMDRAnlHhGZmCazhJiUXJZF36hgoXK9I1qWoSd3YNueMH+Lhi
	 DF/d7AztYTeZSmcp1t4vlkURELt/KpjL1/HjK5I7x22jpgzbjMKu6/FIXq3oVGswghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126554;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=rG8ySpd1iW2MeECK/3VoVBb77o8GMUNj0ctIINg/L10=;
	b=5qwWCknNUjlI2TfTBJgAYoAtgf3VE8TVjZWpnhUfg/9dKvLzHQENVaqU/uWJbhLuj5F0
	 V2+qTBd4JRcLlLpuJliWs055+HJGd5tgn8SSqsz0c/3WthwyGUbbTkIf0xyCPTtujxQb9
	 Ku17HmGGHQev/Xf6c6pFbOp2lpGs470iBlG5CHhiyX//7Q/h4nEMt/sjYeaozHk/h/iwK
	 IsiKSOiFUX48w/TtrJPMxvjjnzNamMOKbT0r+Ar7GYihteaQ9gKqCF3GxXdYusw0wf1p+
	 lrFNKkZtG7GQsUR91moCPqrt0UsUlwbKNuAsXwBLEQiDjteN3a6rf5HwqGHpNBwyJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=TDVR55O7;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1802606A320;
	Thu, 19 Nov 2026 22:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1802606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=TDVR55O7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795126553; x=1826662553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rG8ySpd1iW2MeECK/3VoVBb77o8GMUNj0ctIINg/L10=;
  b=TDVR55O76qLmVZnvaleXoy72ksBUC2ld4KpvbA6TtQ15xHin2ON51+3v
   AkCDgQd19HkTzaAhyQ9qGqMZSpxo9UbOLSC+gXqgFfD1LEcqS2Vd9sx2z
   KIY6afaOKd5icQdXFPE61rhO7bRRzbTTqODVG3nathgnvNgGVnIq5Xyoi
   3B8QCDcFWjhn9ri7UCytVerhwbRo4lvBhu1sZtKpd4XWXv+9WmFn8SOVx
   hLjaa0KAqxcrEI0sz7FN5xiWEzQz+I36Kf5fYK2Ls4M9qMoCD52pAAoea
   k2PKEiyvRKGi4ym8M74x5susNofJWWp40U0/tEyUpReaJbuQTno+DNjSO
   w==;
X-CSE-ConnectionGUID: zr3KRbncQK+kEcd2VcYiNw==
X-CSE-MsgGUID: fFSXlcqnS2eFb3UN2TslBA==
X-IronPort-AV: E=Sophos;i="6.27,221,1787011200"; 
   d="scan'208";a="34359087"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:15:53 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:16723]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id f584f67a-9e5d-41c7-b791-57426c59856d; Thu, 19 Nov 2026 22:15:53 +0000 (UTC)
X-Farcaster-Flow-ID: f584f67a-9e5d-41c7-b791-57426c59856d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 19 Nov 2026 22:15:52 +0000
Received: from dev-dsk-hagan-1f-c6b5e25f.us-east-1.amazon.com (172.19.159.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Thu, 19 Nov 2026 22:15:51 +0000
From: "Craig I. Hagan" <hagan@amazon.com>
To: <anthony.l.nguyen@intel.com>, <przemyslaw.kitszel@intel.com>
CC: <intel-wired-lan@lists.osuosl.org>, <netdev@vger.kernel.org>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
	<tactii@gmail.com>, <aleksandr.loktionov@intel.com>,
	<moriyax.kadosh@intel.com>, <vitaly.lifshits@intel.com>, <hagan@amazon.com>
Subject: [PATCH iwl-net] e1000e: fix link stuck at 10 Mb/s after DMoff exit
Date: Thu, 19 Nov 2026 22:15:48 +0000
Message-ID: <20261119221548.10466-1-hagan@amazon.com>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On an I219 (pch_spt+), a link outage of more than a few seconds (e.g. a
switch reboot) can bring the MAC back in DMoff, with the STATUS speed bits
reading 0. If DMoff has already ended by the time the watchdog runs, the
speed bits can still read 0. The watchdog decodes them as SPEED_10, and the
link stays at 10 Mb/s Full while the PHY is at 1000 Mb/s Full.
rx_crc_errors climb and jumbo traffic stalls until the interface is
manually reset. Seen on deployed machines and reproduced on an I219-LM
(8086:15b7).

The patch "e1000e: restore jumbo config after DMoff exit"
(https://lore.kernel.org/netdev/20260928210552.13266-1-hagan@amazon.com/)
handles DMoff that is still set when the watchdog runs. The watchdog
cannot detect the case above on its own, because STATUS then reads the
same as a real 10 Mb/s Full link.

Record DMoff (PCIM_STATE) in the link status interrupt, next to
mac.get_link_status, and have the watchdog's existing DMoff wait loop
start as if it had seen it, so it takes the same full-reset path.

This depends on that patch. Without it the loop ends in a bare PHY
reset, which clears the 10 Mb/s but not the jumbo configuration.

The unpatched driver stuck at 10 Mb/s on an I219-LM (8086:15b7) when
the switch port was shut for 90 s or the switch power cycled, behind a
Cisco C9200-48P and a TP-Link TL-SG108PE. Reproducing it needs no
kernel change. A debug build that logs STATUS was used to find the
cause, and the patch was tested on the same hardware and switches.

Fixes: def4ec6dce39 ("e1000e: PCIm function state support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Craig I. Hagan <hagan@amazon.com>
---
Please keep this patch and "e1000e: restore jumbo config after DMoff
exit" (queued in net-queue dev-queue) together, in that order, when
they go to net and to stable. Without it, this patch ends in a bare PHY
reset: the link no longer sticks at 10 Mb/s, but the jumbo
configuration is still not restored.

This was seen on deployed machines running the stock Ubuntu 5.4.0-117
driver behind Cisco C9200-48P switches, on both IOS-XE 16.12.3a and
17.9.4a. After a switch reboot, ethtool reported 10 Mb/s Full while
mii-tool showed the PHY at 1000 Full, and rx_crc_errors kept climbing.
One machine stayed in that state for about a week.

On the bench, the unpatched driver on 5.4.0-117 (HZ=250) was logged
across 16 link-ups, each after the switch port had been shut for 90 s.
All 16 read 0x40080003 in the link status interrupt, and in 2 of them
DMoff had already ended by the time the watchdog ran:

  link status interrupt   0x40080003  DMoff, link up, FD, speed bits 0
  watchdog, +14.6 ms      0x00080003  DMoff over, speed bits still 0
  about 100 ms later      0x00080083  1000 Mb/s Full

With the unpatched driver, the link stuck at 10 Mb/s in 2 of 10 outages
behind the Cisco and in 2 of 20 behind a TP-Link TL-SG108PE V3, both on
5.4.0-117 at HZ=250. On 6.17.0-19 and 7.0.0-14 rebuilt with only
CONFIG_HZ changed to 250 (the Kconfig default), it stuck in 2 of 10
outages on each. At HZ=1000 it did not stick: in the logged runs the
watchdog always found DMoff still set, so the existing DMoff handling
ran. The difference comes from HZ, not the kernel version.

Behind the Cisco, every outage that stuck at 10 Mb/s also dropped jumbo
traffic: 8972-byte pings were lost while small pings passed. On
7.4.0-rc2 built from the same dev-queue tree without this patch (HZ=250,
Cisco on 17.9.4a), 2 of 10 outages instead ended at 1000 Mb/s with jumbo
traffic dropped until "ethtool -r". Neither of those two got a full
reset before link-up, and the full reset is what restores the jumbo
configuration ("e1000e: restore jumbo config after DMoff exit"). With
this patch, all 26 trials there got the full reset and passed jumbo
traffic.

With this patch, every reset and link cycle ended at 1000 Mb/s Full
with 8972-byte pings passing. Each cycle cut power to the switch for 5 s
to 4 min, or shut the port for 90 s. The port-shut cycles behind the
Cisco also ran under 200 Mb/s of jumbo traffic.
That covered 50 cycles on 5.4, 129 on 6.17, 404 on 7.0 and 29 on
7.4.0-rc2 (40 each on 6.17 and 7.0 and all 29 on 7.4.0-rc2 at HZ=250),
behind both switches. The new path was taken 21 times at HZ=250, 5 each
on 6.17 and 7.0 and 4 on 7.4.0-rc2, and never at HZ=1000.

 drivers/net/ethernet/intel/e1000e/hw.h     | 1 +
 drivers/net/ethernet/intel/e1000e/netdev.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/hw.h b/drivers/net/ethernet/intel/e1000e/hw.h
index c7ac599e5..efb945590 100644
--- a/drivers/net/ethernet/intel/e1000e/hw.h
+++ b/drivers/net/ethernet/intel/e1000e/hw.h
@@ -604,6 +604,7 @@ struct e1000_mac_info {
 	bool autoneg;
 	bool autoneg_failed;
 	bool get_link_status;
+	bool dmoff_at_lsc;
 	bool in_ifs_mode;
 	bool serdes_has_link;
 	bool tx_pkt_filtering;
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index c3e944ee4..47a6964fa 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -1785,6 +1785,7 @@ static irqreturn_t e1000_intr_msi(int __always_unused irq, void *data)
 	/* read ICR disables interrupts using IAM */
 	if (icr & E1000_ICR_LSC) {
 		hw->mac.get_link_status = true;
+		hw->mac.dmoff_at_lsc = er32(STATUS) & E1000_STATUS_PCIM_STATE;
 		/* ICH8 workaround-- Call gig speed drop workaround on cable
 		 * disconnect (LSC) before accessing any PHY registers
 		 */
@@ -1864,6 +1865,7 @@ static irqreturn_t e1000_intr(int __always_unused irq, void *data)
 
 	if (icr & E1000_ICR_LSC) {
 		hw->mac.get_link_status = true;
+		hw->mac.dmoff_at_lsc = er32(STATUS) & E1000_STATUS_PCIM_STATE;
 		/* ICH8 workaround-- Call gig speed drop workaround on cable
 		 * disconnect (LSC) before accessing any PHY registers
 		 */
@@ -5302,6 +5304,9 @@ static void e1000_watchdog_task(struct work_struct *work)
 			/* Checking if MAC is in DMoff state*/
 			if (er32(FWSM) & E1000_ICH_FWSM_FW_VALID) {
 				pcim_state = er32(STATUS);
+				/* DMoff may have ended since the LSC */
+				if (mac->dmoff_at_lsc)
+					pcim_state |= E1000_STATUS_PCIM_STATE;
 				while (pcim_state & E1000_STATUS_PCIM_STATE) {
 					if (tries++ == dmoff_exit_timeout) {
 						e_dbg("Error in exiting dmoff\n");

base-commit: 6055ab4d82e42de89871db03045b568ed706ef50
-- 
2.47.3

